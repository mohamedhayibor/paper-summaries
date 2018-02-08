[Paradigm Regained:
Abstraction Mechanisms for Access Control](https://viewer.scuttlebot.io/%26YFOinjI%2BT%2FSagWRcdvZumorB7nuFzairOa8RSbkNbLU%3D.sha256)

Security problems are mostly access control problems.

All widely-deployed operating systems routinely allow programs to execute with excessive and largely unnecessary authority.

* Permissions: determine what actions an individual program may perform on objects it can directly access.

* Authority: describes effects a program may cause on objects it can access, either directly by permission, or indirectly by permitted interactions with other programs.

> To understand authority, we must reason about the interaction of program behavior and the arrangement of permissions.

A new look on Object-capabilities:

Expressing policy by using abstraction to extend their expressiveness

Using abstractions
* revocations
* overt-confinement: (cooperatively isolating an untrusted subsystem)
* -properties (one way communication between clearance levels)

### Object Capability Paradigm

* no distinction between subjects and objects
* non-primitive object or instance: a combination of code and state
* state: a mutable collection of references to objects
* computational system: dynamic reference graph on references.
* messages carry references as arguments, thereby changing the connectivity of the reference graph.

> The object capability model uses the reference graph as the access graph, requiring that objects can interact only by sending messages on references.

To get from objects to object capabilities we need merely prohibit certain primitive abilities which are not part of the object model anyway, but which the object model by itself doesn't require us to prohibit.

Whereas the functionality of an object program depends only on the abilities provided by its underlying system, the security of an object-capability program depends on underlying inabilities as well. In a graph of mutually suspicious objects, one object's correctness depends not only on what the rules of the game say it can do, but also on what the rules say its potential adversaries cannot.

The protection state of a system is the arrangement of permissions at some instant in time i.e. (topology of the access graph)

> To render a permission-only analysis useless, a threat model need not include either malice or accident; it need only include subjects following security best practices.

Conclusion:

Programs are able to enforce restrictions on more general, untrusted programs by building on and abstracting more primitive protection mechanisms... Object capability model is the only protection model whose semantics can be readily expressed in programming language terms:

> approximately lambda calculus with local side effects

This provides the necessary common semantic framework for reasoning about permission and program behavior together.


"Capability systems modeled as unforgeable references present the other extreme, where delegation is trivial, and revocation is infeasible" Chander, Dean, Mitchell [Chander01]

POLA: principles of least authority.
