---
title: Go
description: Go
---

![[Knowledge/Engineering/Languages/assets/go-wallpaper.png|800]]

Go is a [[Knowledge/Engineering/Programming/Programming Paradigm|statically-typed]] *compiled* language inspired by [[Knowledge/Engineering/Languages/C|C]] in design, but aims to provide memory safety, ease of usage, and the high performance of close-to-metal languages like [[Knowledge/Engineering/Languages/C++|C++]] and [[Knowledge/Engineering/Languages/Rust|Rust]], which Go is often compared to. The main overarching difference is that Go makes language design decisions that favour ease of usage over speed.

Notably, Go is credited for improving the developer experience in writing [[Knowledge/Engineering/Programming/Concurrency|concurrent]] code with concurrency constructs built into the language. It's also credited with very fast compilation/build times, which is one reason why Go is prevalent in DevOps.

Go is general-purpose, but it's typically used for building:
- Backend servers in combination with a framework like [Gin](https://gin-gonic.com/).
- Complex scripts and CLIs. For one-off scripts, [[Knowledge/Engineering/Languages/Python|Python]] is quicker to write, but for long-lived scripts used frequently, Go might be better.
- Data-intensive algorithms.

---

> I learned Go mainly from the official ['A Tour of Go'](https://go.dev/tour/) tutorial and official docs.

## Packages
All Go programs consist of *packages*, which consist of source files defining a bunch of functions, variables, etc. Program execution starts in the `main` package. 

Outside of the standard library, there is a rich Go packages ecosystem searchable at [pkg.go.dev](https://pkg.go.dev). This is an [awesome community list](https://awesome-go.com/) of packages.

### Imports
Import statements like `import fmt` creates a binding `fmt` that lets you access the package's functions.
- If you do `import math/rand`, it uses the last name in the path to create the binding, creating the `rand` binding in this case.
- It's preferred to group import statements into parentheses:
	```go
	import (
	    "fmt"
	    "math"
	)
	```

### Exports
A binding is exported if it starts with a capital letter, otherwise, it remains only accessible within its package. It's that simple.

## Variables
Variables are declared with `var` and can be done at the package-level or function-level.
```go
// Package-level variables.
var foo string = "Hi"

func main() {
	// Function-level variables.
	var bar int = 42

	// An equivalent short-hand syntax using :=
	// Note how the type of `baz` is inferred.
	baz := 24
}
```
- Types always come *after* the variable/parameter name, like [[Knowledge/Engineering/Languages/TypeScript|TypeScript]]. **Why?** In short, with C-style type declaration, complex types quickly become unreadable, eg. `int (*foo)(int (*)(int, int), int)`. By specifying the type after the symbol name, you have significantly more readable complex types: `foo func(func(int, int) int, int) int` ([official blog](https://go.dev/blog/declaration-syntax)).
- Uninitialised variables will take on a default value defined by the language standard: `0` for numeric types, `false` for boolean, `""` for strings.

### const
Like in JavaScript, you can make bindings `const` which prevents them from being reassignable after being declared.
```go
const Pi = 3.14
```

## Type System
Go is statically-typed, so the type of every symbol should be known at compile-time.

### Primitive Types
Go's primitive types include: `bool`, `string`, `int` (and all its variants like `uint` and `int64`), `float32`,`float64`, `complex64` and `complex128` for complex numbers.

## Functions
Functions declarations look like this in Go. 
```go
func foo(a int) int {   // 
	return a + 42;
}
```

### Multiple Return Values
Unlike most languages, you can return multiple values without needing to wrap it in a data structure.
```go
func foo() (int, int) {
	return 42, 24
}

func main() {
	a, b := foo()    // a → 42, b → 24.
}
```

## Basic Constructs
### Looping
All looping is done with `for`. You never use parentheses.
```go
// Regular for-loop.
for i := 1; i < 42; i++ {
	// ...
}

// While loops.
for i < 42 {
	// ...
}
```

### If-Else
Go has regular `if`, `else if`, `else` like most languages, but you never use parentheses.
```go
func main() {
	theme := "dark"
	if theme == "dark" {
		fmt.Println("🌙")
	} else if theme == "light" {
		fmt.Println("☀️")
	} else {
		fmt.Println("🎨")
	}
}
```

### Switch
Go has a switch-case construct like most languages, but it's unnecessary to `break` after each case to prevent 'running through' each case.
```go
switch theme {
	case "dark":
		fmt.Println("🌙")
	case "light":
		fmt.Println("☀️")
	default:
		fmt.Println("🎨")
}

// Switch-case blocks don't need a switch condition. You can omit it to write a cleaner
// version of a long if-else-if sequence.
switch {
	case x > 0:    // if 
		// ...
	case x < 0:    // else if
		// ...
	default:       // else
		// ...
}
```
