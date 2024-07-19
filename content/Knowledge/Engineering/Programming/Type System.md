---
title: Type System
description: Type System
---

A *type system* is a set of rules defined by a programming language specification that assigns a *type* to every variable, expression, function, and possibly other things beyond those. 

### Why Type Systems Exist
Type systems exist for one reason: to help you write less buggy code in a more self-documenting way.
- Giving variables, values, functions, etc. a *type* restricts the set of things you can do with them which helps us by minimising the chance of creating situations where the program tries to add the integer `3` to an instance of `C[]()at`. 
- It forces users of an interface to always supply an expected value.

### Static Typing
A *statically typed language* is one where the type system's rules are checked when you run the compiler (ie. at compile-time). It's called 'static' because any type system violations are caught before you execute a single line of your program.
- Languages like [[Knowledge/Engineering/Languages/C|C]] and [[Knowledge/Engineering/Languages/Java|Java]] are statically typed. Every valid C or Java program will always know what type an expression, variable, function has before execution.

### Dynamic Typing
A *dynamically typed language* is one where the type system's rules are checked during the execution of the program rather than at compile-time. In other words, nothing has a type until you run the program, and only then do the types get assigned to expressions, variables, functions, etc.
- [[Knowledge/Engineering/Languages/Python|Python]] is a dynamically typed language. You could code up some very obvious type errors like `x = 1 + "hi"` but the program will run fine until it actually executes that line.
- There is an important trade-off to recognise between static typing and dynamic typing: you would get fewer run-time errors with static typing, however dynamic typing affords you far more flexibility, which generally helps you implement things faster (at least in the short-term).

### Strong Typing
There's a lack of a formal definition for this, but a *strongly typed* language is basically one where it is *not possible* for the developer to bypass the type system's rules. In other words, a value's type never changes in unexpected ways, such as through *implicit casts*.
- [[Knowledge/Engineering/Languages/Python|Python]] is a strongly typed language. It's not possible to implicitly typecast values.
- **Note**: a language can be both strongly and dynamically typed.
	```python
	x = 42
	x = "Hello"
	```

### Weak Typing
Just like *strong typing*, there is a lack of a formal definition, but in general: weakly typed programming languages are ones that have a more relaxed enforcement of its type system's rules, meaning that it's possible to violate/bypass them.
- [[Knowledge/Engineering/Languages/C|C]] is a classic weakly typed language. Pointers and integers are pretty much fully interchangeable, and you can freely convert a pointer of any type to a pointer of any other type.
	> "C is not a strongly-typed language, but as it has evolved, its type checking has been strengthened. " - Dennis Ritchie.
- [[Knowledge/Engineering/Languages/JavaScript|JavaScript]] is also a weakly typed language. It's notorious for silently producing (sometimes hilariously) unintuitive results.
	```javascript
	"11" + 1 === "111"
	"11" — 1 === 10

	('b' + 'a' + + 'a' + 'a').toLowerCase() === "banana"   // See an explanation: https://stackoverflow.com/questions/57456188/why-is-the-result-of-ba-a-a-tolowercase-banana
	```
 
Sometimes, we talk about the relative *weakness* of the type system between different programming languages. Eg. C++ is not strongly typed, however it is consider 'stronger' than C.

**Note**: people often confuse *weak* typing to mean *dynamic* typing, and *strong* typing with *static* typing. They're completely separate. For example, C is both weakly typed and statically typed, while Python is both strongly typed and dynamically typed.
