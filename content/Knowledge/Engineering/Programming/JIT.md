---
title: JIT
description: JIT
---

*JIT (just-in-time) compilation* is when source code (or *bytecode*) gets compiled on-demand at runtime *as it executes* rather than prior to being executed. JIT compilation is a feature of an [[Knowledge/Engineering/Programming/Interpreter|interpreter]]. Traditionally, source code is compiled to machine code directly by an [[Knowledge/Engineering/Programming/AOT|AOT compiler]] like `gcc` for C and C++, meaning no further compilation is done during execution.

## JIT vs. AOT
- JIT tends to be better during development. AOT tends to be better during production, but not necessarily always since a JIT compiler works at runtime, it can make optimisations like inlining functions that are invoked frequently (which minimises the overhead in the low level operation of setting up a function context).
    - In languages like Dart and TypeScript, it's common to use a JIT compiler during development and then compile everything for production using an AOT compiler.
- JIT tends to be less secure than AOT because of [JIT spraying exploits](https://en.wikipedia.org/wiki/JIT_spraying).
