---
title: JavaScript
description: JavaScript
---

TODO.

There's also [[Knowledge/Engineering/Languages/TypeScript]].



### Rest Operator
TODO.


### Generators
TODO.

## Object Oriented Programming
### Classes
TODO.

### Inheritance
TODO.

### Prototypes
TODO.


## Modules
First, a brief timeline of JavaScript's weird module system development:
- **1995**: JavaScript was born, but there was no concept of modules which made building complex applications extremely hard. Without modules, a single huge javascript file might be shipped to the user.
- **2009ish**: people introduced a module system to take advantage of the [[Knowledge/Engineering/Programming/Code Splitting|code splitting]] optimisation technique where modules are lazily loaded.
- **2009ish**: Node.js was developed and introduced the [[Knowledge/Engineering/Languages/JavaScript#CommonJS|CommonJS]] module standard, but this was only usable in server-side environments.
	- **2011**: [Browserify](https://browserify.org/) made it possible to use `require` in frontend projects.
- **2009ish**: the [AMD](https://github.com/amdjs/amdjs-api/wiki/AMD) module standard was popularised.
- **2015**: ES2015 standardised the [ES Modules](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules) `import`/`export` syntax.

### CommonJS
TODO.


### Dynamic Import
`import(path)`

## Asynchronous Programming

### Event Loop
TODO.



.. multiplexing tasks over a single thread, which means there is no need for mutexes, semaphores and other concurrency helpers.

an event-looped model is different from a multithreaded model.

When you *do use real multithreading* in JavaScript (through [[Knowledge/Engineering/Languages/JavaScript#Web Workers|Web Workers]] in a browser environment or forking to create child processes in a server environment), you rarely use shared memory, meaning there's no need to coordinate concurrent access to shared resources.

### Web Workers
TODO.
Web workers are background threads. They can 
