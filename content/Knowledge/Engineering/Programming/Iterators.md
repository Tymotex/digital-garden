---
title: Iterators
description: Iterators
---

An **iterator** is an *object* that lets you loop through an **iterable**, usually by invoking, implicitly or explicitly, a `next` method.
- In Python, iterators are objects that expose the `__next__`  [[Knowledge/Engineering/Languages/Python#Dunder Methods|dunder method]] which can be invoked to retrieve the next value in the **iterable**.

An **iterable** is an object containing a collection of items that you can *get an **iterator** from*, usually, via a method. Iterables are stateless and have no concept of what element is the 'current' element in a traversal – that is what the iterator handles.
- In Python, that method is `__iter__`.
- In C++, that method is usually `begin`.

Many programming languages give you a for-loop variant that basically serves as syntactic sugar in using looping through the items in an **iterable**.
- In Python, when you say `for item in iterable`, what happens behind the scenes is the iterable's `__iter__` method gets called to get an iterator, then `item` is assigned to whatever the iterator's `__next__` method returns. The for loop stops when `__next__` raises a `StopIteration` exception.
- In C++, they're called *range-based for* loops with the syntax `for (T item : iterable) statements`.
- In C#, they're called *foreach* loops with the syntax `foreach (T item in iterable) statements`.
- In JavaScript, they're called *for of* loops with the syntax `for (let item of iterable) statements`
- ... and so on.

### Iterator Design Pattern
The purpose of iterators is to let the user access the elements of a data structure through a consistent interface, regardless of whether they're iterating through items in a vector, a binary search tree, a graph, a hash map, etc. All these data structures will provide a way for the user to get an iterator from them that can be used in a for loop, for example.
