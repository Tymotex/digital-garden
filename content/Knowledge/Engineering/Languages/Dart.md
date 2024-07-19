---
title: Dart
description: Dart
---

![[Knowledge/Engineering/Languages/assets/dart-wallpaper.png|700]]

Dart is a [[Knowledge/Engineering/Programming/Type System#Static Typing|statically-typed]] and [[Knowledge/Engineering/Programming/Object Oriented Programming|object-oriented]] programming language, designed specifically for building cross-platform apps/frontends that can be run on Android, iOS, native desktop (Windows, macOS, Linux) and web browsers. Its syntax is similar to a merging of Java, JavaScript and TypeScript. Although it's intended to be used for building frontends, Dart can also be used on the server, just like JavaScript.

## Compilation Model
The Dart [[Knowledge/Engineering/DevOps/Virtual Machines#Process Virtual Machine|virtual machine]], which ships with the [Dart SDK](https://dart.dev/get-dart), enables Dart code to be compiled to the native (machine) code for mobile devices or desktops.

Dart source code can also be transpiled to [[Knowledge/Engineering/Languages/JavaScript|JavaScript]] for the web browser (using [dart2js](https://dart.dev/tools/dart2js), which also ships with the Dart SDK).

JIT compilation. 

AOT compilation.

## Core

**Questions**
- ' vs "
- When invoking functions, you can set named parameters like `color: Colors.red`
- Callbacks: `(params) { ... }` and `(params) => ...`?
- `const`
---

`final`
Floored division: `5 ~/ 2 == 2`

Ternary operator: `() ? () : ()`.


Any identifier whose name starts with `_` becomes privately scoped to the file it's in. No other file in the project can access that identifier.


Set: `<Type>{}`

Array: `<Type>[]`
 
## Dart Libraries
TODO core libraries: https://dart.dev/guides/libraries/library-tour

TODO: pub.dev
