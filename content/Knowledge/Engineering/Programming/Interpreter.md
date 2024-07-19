---
title: Interpreter
description: Interpreter
---

Interpreters are programs that take in source code and executes it directly *without* compiling it to machine code. Instead, a common way interpreters are implemented is to parse source code, compile it to an intermediate representation (often called *bytecode*), then hands that off to a [[Knowledge/Engineering/DevOps/Virtual Machines#Process Virtual Machine|virtual machine]] to execute.

Interpreters may or may not use a [[Knowledge/Engineering/Programming/JIT|JIT]] compiler.

## Interpretation vs Compilation
> Interpretation and compilation are not mutually exclusive and are not simply alternatives of each other. Likewise, *interpreted languages* and *compiled languages* don't necessarily mean that they must be only put through an interpreter or compiler respectively. 

*Interpretation* is just "given this source code, do what it says", which is basically just executing the source code directly (from the programmer's perspective). *Compilation* is a mapping from language A to language B, like converting C++ code into x86 machine code.

When we say a language is a *compiled language* or *interpreted language*, it really just means that the canonical or official compilation model intended by the language designers is to have the language be fed through a compiler or interpreter, respectively. Whether or not a language is compiled/interpreted is *not* a property that's tied to the programming language, but rather **how it's implemented**. A *compiled language* like C++ does actually have interpreters you can use for it, and an *interpreted language* like Python does have compilers.

> You can have both compilers and interpreters for the same programming language. 
