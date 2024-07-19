---
title: Programming Paradigms
description: TODO.
---
A *programming paradigm* describes a general *strategy* for how to write software. Formally, a 'paradigm' in everyday English is:
> A set of assumptions, concepts, values, and practices that constitutes a way of viewing reality for the community that shares them.

Below is a hierarchy of very popular, battle-tested programming paradigms, each with their own pros and cons. You can solve pretty much *any* software problem in *any* paradigm, really, but the solution will differ in terms of scalability, maintainability, difficulty, etc.
![[Knowledge/Engineering/Programming/assets/programming-paradigms.png]]
**Note**: there are more paradigms than shown here.

Programming languages often support multiple programming paradigms. For example, JavaScript supports both [[Knowledge/Engineering/Programming/Object Oriented Programming|object-oriented programming]] and [[Knowledge/Engineering/Programming/Functional Programming|functional programming]] (and more).

### Imperative
Programs are a set of precise instructions for the machine to perform that mutate program state.
- **Procedural** – programs are just a sequential collection of data and functions (procedures) acting on that data. C is a classic example of a procedural language.
- **Object-oriented** – programs are just objects interacting with each other. Objects are just a container that groups together some data and methods (functions). 

### Declarative
Programs should be written descriptively, meaning that your code should always express the 'what' rather than the 'how'. SQL, for example, is a declarative language, since the statement `SELECT * FROM Table` expresses what you want, but the 'how' is delegated tot he SQL engine. Ultimately, 
- **Functional** – programs are made by calling and composing functions.

Ultimately, languages that support a declarative paradigm are just abstractions over an imperative 'backend'.
