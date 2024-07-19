---
title: Generators
description: Generators
---

Generators are *just functions* which, when invoked, will give you a single value from a list of values. They're *stateful* functions which return the next value in a list of values for each successive invocation.

Usually, programming languages will give you a `yield` keyword which works basically the same way as `return`, but when the function is invoked again, execution resumes after the last `yield`. For example, below is a generator in Python.
```python
def foo_generator():
	yield 2
	yield 3
	yield 5

g = foo_generator()
print(next(g))      # → 2
print(next(g))      # → 3
print(next(g))      # → 5
```
At each `yield` statement, execution is suspended at that line and exeuction resumes at the line right after until the next `yield` or until the function terminates.

**Note**: normally, when you invoke a function, a [[Knowledge/Engineering/Operating Systems/Stack Frame|stack frame]] gets allocated on the [[Knowledge/Engineering/Operating Systems/Program Memory#Stack|stack]] section of memory. When you invoke a generator function, the 'stack' frame actually gets allocated in the [[Knowledge/Engineering/Operating Systems/Program Memory#Heap|heap]] instead (at least in [CPython](https://github.com/python/cpython)) and so they persist separately from the regular function call stack.

### Generators & Iterator
All *generators* are [[Knowledge/Engineering/Programming/Iterators|iterators]]. When you invoke a generator function, it returns an *iterator* which you can loop through by invoking some function/method like `next` on them (in the case of Python).

### Why Use Generators?
Normally, when you need a list of values of some kind, you'd call a function which returns that entire list of values back to you. Generators are *lazy*, so they only return one value of a stream of values at a time. In other words, you get values from a stream of values *on-demand* rather than getting all values upfront. This is great when you don't know how many values from a stream of values you might need. If you really needed the first 10 values, but you loaded all 1000 values upfront, for example, you're hogging an **unnecessarily large amount of memory**. With generators, you only really hold the memory for a single value of the list, so it's a really common way to optimise for memory usage.

Generators are also a great way to represent streams of infinite values. For example, it might make sense to write a prime numbers generator function only get the next prime number, on-demand.
