---
title: Rust
description: Rust
---

TODO: continue at chapter 3 in The Rust Programming Language book: https://doc.rust-lang.org/book/ch03-00-common-programming-concepts.html.

![[Knowledge/Engineering/Languages/assets/rust-wallpaper.png|800]]
> "Rust's greatest ambition is to eliminate the trade-offs that programmers have accepted for decades by providing safety *and* productivity, speed *and* ergonomics." — *The Rust Programming Language*

Rust is a [[Knowledge/Engineering/Programming/Type System#Strong Typing|strong]] [[Knowledge/Engineering/Programming/Type System#Static Typing|statically typed]] low-level programming language that supports many [[Knowledge/Engineering/Programming/Programming Paradigm|programming paradigms]]. It's designed to have comparable performance to C/C++ while offering great developer experience and preventing pitfalls in low-level programming such as memory leaks, security vulnerabilities, etc.

> Rust is named after [a fungus](https://en.wikipedia.org/wiki/Rust_(fungus)) that is robust, distributed, and parallel.

When you install Rust, you also get the following CLIs:
- `rustup` — a Rust version manager.
- `rustc` — the [[Knowledge/Engineering/Programming/AOT|ahead-of-time]] Rust compiler, similar to `gcc` for C/C++. For bigger projects, you'd use `cargo` to compile and run the project, not `rustc`.
- `cargo` — the dependency manager *and* build tool.
- `rustfmt` — a formatter for enforcing code style.

## Core
Every Rust program must implement one `main` function as the entrypoint to the program.

### Variables
Declare variables with `let`.
- All variables are immutable by default.
    - In languages like JavaScript or C++, you'd explicitly specify this with the `const` qualifier.
- Use the `mut` qualifier to allow a variable to be assigned to another value after initialisation.
    ```rust
    let mut i = 0;
    ```
- Rust implements type inference, similar to TypeScript.
- *Variable shadowing* is allowed. Instead of getting a 'variable redefinition' error, Rust lets you reuse the same binding which is useful for when you need to typecast.
    ```rust
    let mut meaningOfLife: String = "Forty two";
    let meaningOfLife: u32 = 42;
    ```

#### References
You can pass a reference to a variable in function calls so that they read/write to the same variable's memory. Like variables, *references are immutable by default*, even if it's a reference to a mutable variable.

```rust
let mut buffer = String::new();
io::stdin()
    .read_line(&mut buffer)
    .expect("Failed to read from stdin.");
```

### Functions
### Macros
You invoke macros the same way as invoking functions, but you append `!` to the macro name.
Eg. `println!("Hello world")` invokes the `println` macro.

### Strings

Expressions can be interpolated into strings with `{}`. For example: `"Hello {name}"`.

### Imports

Like C++, Rust has a standard library accessible under the `std` namespace. 

Write `use` statements to bring new bindings into scope in the current file. For example: `use std::io`.

### Memory Management
Rust does not use a garbage collector to implement memory safety like in most languages. Instead, it achieves memory safety through *ownership and borrowing*.

### Pattern Matching
`match` expressions consist of *arms*, each of which contain a pattern/condition and the code to execute when that pattern/condition is matched. 

### Traits

### Error Handling
Error handling is done through `std::result::Result`. 
... `Result` is an enum that can exist in multiple states, eg. `Ok` and `Err`.
- `Ok` wraps around the successful path's expected value.
- `Err` contains information about the failure.

### Cargo
Rust projects using Cargo must go by a standard directory structure where all source code is kept in `src`. 
```bash
cargo new <project_name>  # Creates a new directory, boilerplate and `Cargo.toml` file.
cargo build               # Compiles the project, dumping to output to a `target` directory.
    --release             #   → builds and optimised executable for production.
cargo run                 # Compiles and runs the project.
cargo check               # Sanity-checking that compilation works. Doesn't produce executables.

cargo doc --open          
``` 

We call dependencies 'crates'. They can either be *binary crates*, which build to an executable, or *library crates*, which contain code that is to be consumed by other crates. External dependencies are fetched from the registry: [crates.io](https://crates.io/).

## WebAssembly

