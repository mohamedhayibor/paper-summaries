/// =================
/// Voting interface
/// =================

/**
@notice Commits vote using hash of choice and secret salt to conceal until reveal
@param pollID Integer identifier associated with target poll
@param secretHash Commit keccak256 hash of voter's choice and salt (tightly packed in this order)
@param numTokens The number of tokens to be committed towards the target poll
@param prevPollID The ID of the poll that the user has voted the maximum number of tokens
*/

function commitVote(uint pollID, bytes32 secrethash, uint numberTokens, uint prevPollID) external {
    require(commitPeriodActive(pollID));
    require(voteTokenBalance[msg.sender] >= numTokens);     // prevent from user overspending
    require(pollID != 0);

    uint nextPollID = dllMap[msg.sender].getNext(prevPollID);

    require(validPosition(prevPollID, nextPollID, msg.sender, numTokens);
    dllMap[msg.sender].insert(prevPollID, pollID, nextPollID);

    bytes32 UUID = attrUUID(msg.sender, pollID);

    store.attachAttribute(UUID, "numTokens", numTokens);
    store.attachAttribute(UUID, "commitHash", uint(secretHash));
}

/**
@dev compares and next poll's committed tokens for sorting purposes
@param prevID Integer identifier associated with previous poll in sorted order
@param nextID Integer identifier associated with next poll in sorted order
@param voter Address of user to check DLL position for
@param numTokens the number of tokens to be committed towards the poll (used for sorting)
@return valid Boolean indication of if the specified position maintains the sort
*/

function validPosition(uint prevID, uint nextID, address voter, uint numTokens) public constant returns (bool valid) {
    bool prevValid = (numTokens >= getNumTokens(voter, prevID));
    // if next is zero node, numTokens does not need to be greater
    bool nextValid = (numTokens <= getNumTokens(voter, nextID) || nextID == 0);
    return prevValid && nextValid;
}


/**
@notice Reveals vote with choice and secret salt used in generating commitHash to attribute committed tokens
@param pollID Integer identifier associated with target poll
@param voteOption Vote choice used to generate commitHash for associated poll
@param salt Secret number used to generate commitHash for associated poll
*/

function revealVote(uint pollID, uint voteOption, uint salt) external {
    // Make sure the reveal period is active
    require(revealPeriodActive(pollID));
    require(!hasBeenRevealed(msg.sender, pollID));         // prevents user from revealing multiple times
    require(sha3(voteOption, salt) == getCommitHash(msg.sender, pollID)); // compare resultant hash inputs to original commitHash // make sure the supposed staker is calling it

    uint numTokens = getNumTokens(msg.sender, pollID);

    if (voteOption == 1) // apply numTokens to appropriate poll choice
        pollMap[pollID].votesFor += numTokens;
    else
        pollMap[pollID].votesAgainst += numTokens;

    dllMap[msg.sender].remove(pollID); // upon reveal remove node referring to this vote
}


/**
@param pollID Integer identifier associated with target poll
@param salt Arbitrarily chosen integer used to generate secretHash
@return correctVotes Number of tokens voted for winning option
*/

function getNumPassingTokens(address voter, uint pollID, uint salt) public constant returns (uint correctVotes) {
    require(pollEnded(pollID));
    require(hasBeenRevealed(voter, pollID));

    uint winningChoice = isPassed(pollID) ? 1 : 0;
    bytes32 winnerHash = sha3(winningChoice, salt);
    bytes32 commitHash = getCommitHash(voter, pollID);

    return (winnerHash == commitHash) ? getNumTokens(votes, pollID) : 0;
}

/// =================
/// Polling Interface
/// =================

/**
@dev Initiates a poll with canonical configured parameters at pollID emitted by PollCreated event
@param _voteQuorum Type of majority (out of 100) that is necessary for poll to be successful
@param _commitDuration Length of desired commit period in seconds
@param _revealDuration Length of desired reveal period in seconds
*/

function startPoll(uint _voteQuorum, uint _commitDuration, uint _revealDuration) public returns (uint pollID) {
    pollNonce = pollNonce + 1;

    pollMap[pollNonce] = Poll({
        voteQuorum: _voteQuorum,
        commitEndDate: block.timestamp + _commitDuration,
        revealEndDate: block.timestamp + _commitDuration + _revealDuration,
        votesFor: 0,
        votesAgainst: 0
    });

    PollCreated(pollNonce);
    return pollNonce;
}


/**
@notice Determines if proposal has passed
@dev Check if votesFor out of totalVotes exceeds votesQuorum (requires pollEnded)
@param pollID Integer identifier associated with target poll
*/

function isPassed(uint pollID) constant public returns (bool passed) {
    require(pollEnded(pollID));

    Poll poll = pollMap[pollID];

    return (100 * poll.votesFor) > (poll.voteQuorum * (poll.votesFor + poll.votesAgainst);

    // return ((100 * poll.votesFor) / (poll.votesFor + poll.votesAgainst) >= poll.voteQuorum);
}

/// ===============
/// Polling Helpers
/// ===============

/**
@dev gets the total winning votes for reward distribution purposes
@param pollID Integer identifier associated with target poll
@return Total number of votes committed to the winning option for specified poll
*/

function getTotalNumberOfTokensForWinningOption(uint pollID) constant public returns (uint numTokens) {
    require(pollEnded(pollID));

    if (isPassed(pollID))
        return pollMap[pollID].votesFor;
    else
        return pollMap[pollID].votesAgainst;
}


/**
@notice Determines if poll is over
@dev Checks isExpired for specified poll's revealEndDate
@return Boolean indication of whether polling period is over
*/
function pollEnded(uint pollID) constant public returns (bool ended) {
    return isExpired(pollMap[pollID].revealEndDate);
}


/**
@notice Checks if the reveal period is still active for the specified poll
@dev Checks isExpired for the specified poll's revealEndDate
@param pollID Integer identifier associated with target poll
*/
function revealPeriodActive(uint pollID) constant public returns (bool active) {
    return !isExpired(pollMap[pollID].revealEndDate) && !commitPeriodActive(pollID);
}


