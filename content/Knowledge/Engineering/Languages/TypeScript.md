---
title: TypeScript
description: TypeScript is a programming language made by Microsoft that is superset of JavaScript.
---

![[Knowledge/Engineering/Languages/assets/javascript-wallpaper.png|600]]

TypeScript is a programming language made by Microsoft that is *superset* of [[Knowledge/Engineering/Languages/JavaScript|JavaScript]]. The reason that TypeScript exists is to make complex JavaScript projects more maintainable and less error-prone by introducing a [[Knowledge/Engineering/Programming/Type System#Static Typing|static]] and [[Knowledge/Engineering/Programming/Type System#Strong Typing|strong]] type system. Essentially, it just gives developers a lot of quality-of-life improvements over JavaScript.

*Note*: TypeScript gets compiled (or more precisely, '*transpiled*') to JavaScript in the end. This is not new, languages like CoffeeScript, Dart, Scala, etc. can all have JavaScript as what we call a *compilation target*.

> I learned TypeScript from the official docs and from the 'Programming TypeScript' textbook by Boris Cherny.

**Why TypeScript is [loved](https://survey.stackoverflow.co/2022/#most-loved-dreaded-and-wanted-language-love-dread)**
- Your IDE/editor gets more information about your code and give you very helpful intellisense and code-completion that is not possible with JavaScript. This reason alone, in my experience, pretty much negates any loss in developer velocity from using TypeScript over JavaScript.
- Many errors will surface *as you're developing* rather than after your code is deployed to production and angry customers complain to you.
- Types serve as a useful concise form of documentation for how your functions are to be used and what fields an object contain.
- Complex objects are much *less unpleasant* to work with. You'll know what its *shape* is (basically what properties it has and what its nested objects look like), what properties are compulsory or optional and you'll actually know when you've mispelt a property name.
- You'll *almost* never have `cannot read property '...' of undefined` again.

## Setup
Install Node.js, `npm` or `yarn`. Then, install `tsc`, the open-source typescript compiler, as a dev dependency in a javascript project:
```bash
yarn init   # Inside the project root directory, if it's a new project.
yarn add --dev typescript @types/node ts-node
```
### tsconfig.json
Every typescript project should have a `tsconfig.json` file at the root of the project directory. It tells `tsc` which files to compile, where to dump the resulting javascript, and so on. A basic config looks like this (but there are so many [more options](https://www.typescriptlang.org/tsconfig)):
```json
{
	"compilerOptions": {
		"lib": [   // Which APIs are available to the transpiled JS code? Eg. es2015 has Function.prototype.bind, etc.
			"es2015"
		],
		"module": "commonjs", // Which module system should be used by the transpiled JS code?
		"outDir": "dist",     // Where should the output JS files go?
		"sourceMap": true,    // Whether to generate a source map.
		"strict": true,       // All code must be properly typed.
		"target": "es2015"    // What JS version to compile to.
	},
	"include": [   // Directories containing .ts files we want to transpile.
		"src"
	]
}
```
Alternatively, you can generate a `tsconfig.json` with `tsc --init`.

Some recommended flags include:
- `noImplicitThis` – forces a type to be explicitly assinged to `this` inside functions. See [[Knowledge/Engineering/Languages/TypeScript#this|TypeScript this]].
- `noImplicitOverride` – you must always use the `override` modifier for method overriding.
- `noFallthroughCasesInSwitch` – every case must either `break` or `return`.
- [`esModuleInterop`](https://www.typescriptlang.org/tsconfig#esModuleInterop) – makes it more smooth to consume JavaScript modules that use CommonJS, AMD or other module systems.

## Typing
Broadly speaking, in programming languages, a *type* is a [[Knowledge/Engineering/Maths/discrete-maths/Set Theory#Sets|set]] of values, plus the properties/methods available to them.

### Assigning Types
Assigning types is straightforward in TypeScript, you just postfix a variable or parameter with a colon and a type. 
```typescript
// Typing variables.
let a: number = 42;
let b: string;
```

### Defining Types
Remember, types are just [[Knowledge/Engineering/Maths/discrete-maths/Set Theory#Sets|sets]] of values. When you define a *type*, you are just defining a set of values. The following are all examples of custom types you can define:
```typescript
type TwoOrFour = 2 | 4;                           // The set consisting of 2 and 4.
type Value = string | number;                     // The set of all strings and all numbers.
type RandomThings = "Hello" | 42 | null | RegExp; // The set consisting of "Hello", 42, null and all instances of `RegExp`.
```

An important thing to understand about TypeScript (and many other statically-typed languages) is that it has separate namespaces for *values* and *types*. This means that in the following example, a variable identifier with the same name as a type alias are not in conflict. TypeScript can infer if you meant the *value* or the *type*.
```typescript
type hello = "world";
const hello: hello = "world";
```

#### Type Alias
You can declare *type aliases* in a very similar way as to how you define variables. Type aliases are block-scoped, just like local variables.
```typescript
type Person = { age: number, name: string };

// Typescript will never infer that `me` is of type `Person` unless you explicitly say.
const me: Person = {
	age: 21,
	name: "Tim"
};
```

### Interface
Interfaces are basically an alternative to [[Knowledge/Engineering/Languages/TypeScript#Type Alias|type aliases]], but are mostly better suited for defining object shapes. You can't use `&` or `|` for interfaces, but you can use `extends`.
```typescript
// With type aliases, to add additional fields on top another type, you'd use `&`.
type Employee = { id: string; }
type SoftwareEngineer = Employee & { techStack: string[]; }

// With interfaces, you just use `extends`, similar to how you do class inheritance.
interface Employee { id: string }
interface SoftwareEngineer extends Employee { techStack: string[]; }
```

#### Classes vs. Interfaces
Using `interface` does not actually generate any javascript code when transpiled. Using `class`, however, will generate JavaScript code, which enables `instanceof` to work at runtime. A `class Foo { ... }` definition actually creates a *value* `Foo` that can be used in expressions, and a *type* `Foo` that can be used as a type. 

Interfaces don't let you use [[Knowledge/Engineering/Languages/TypeScript#Access Modifiers|access modifiers]]. You can't supply implementations either.

Keep these critical differences in mind when deciding between `class` or `interface`.

### Assignability
Assignability is about what the rules are around an assignment like this: `const a: A = b;`, where `b` is of type `B`. For assignment to be valid, it must be the case that:
1. `B` is a subtype of `A` (basically that $B \subseteq A$),
2. ... or `B` is `any`. *Note*: this rule only exists to make it easier to interoperate with javascript code.

#### Union and Intersection
Again, types are just *sets* of values. To expand the size of a set, you can union it with other sets, and to narrow the size of a set, you can intersect it other sets. In TypeScript, we use `|` to union two types and `&` to intersect two types.
```typescript
type Student = { id: string; degree: string };
type Tutor = { id: string; courses: string[] };

type StudentOrTutor = Student | Tutor;    // Set of all objects that are either `Student`, `Tutor`, or both.
type StudentAndTutor = Student & Tutor;   // Set of all objects containing all fields of `Student` AND `Tutor`.

const student: Student = { id: '111', degree: 'Bachelor of Science' };
const tutor: Tutor = { id: '222', courses: ['CS101'] };
const studentTutor: StudentAndTutor = {
	id: '333',
	degree: 'Bachelor of Computer Science',
	courses: ['CS201'],
};

// For `Student | Tutor`: you can assign any of: `Student`, `Tutor`, or `Student & Tutor`
const uniGoers: StudentOrTutor[] = [student, tutor, studentTutor];

// For `Student & Tutor`: you can only have people who are simultaneously `Student` and `Tutor`.
const studentTutors: StudentAndTutor[] = [studentTutor];
```
To make a type nullable, you can union it with `null` like this: `type MiddleName = string | null;`

### TypeScript Built-In Types
TypeScript introduces some new built-in data types that aren't present in JavaScript. These are: `any`, `unknown`, `void`, [`never`](https://www.typescriptlang.org/docs/handbook/2/narrowing.html#the-never-type).
#### any
The `any` type represents the set of *all* values. You can assign a variable of type `any` to a number, a string, a WebServer object, etc. Only use `any` as a last resort – always prefer assigning the most specific type that you can. Often, people treat `any` as a way to 'opt' out of TypeScript for a small part of the code. When something is `any`, you are free to do erroneous things on it such as invoking methods on it that don't exist, using in arithmetic expressions, accessing undefined properties, etc.

#### unknown
The `unknown` type represents the set of *all* values, just like `any`. The difference is that TypeScript does not allow you to use an `unknown` value until you perform [[Knowledge/Engineering/Languages/TypeScript#typeof and instanceof|type checks]] 
or [[Knowledge/Engineering/Languages/TypeScript#Refinement|refinement]] to narrow down what specific type the `unknown` value is. For this reason, `unknown` is considered the type-safe version of `any`.
```typescript
const a: unknown = 30;
if (typeof a === 'number') {
	const b: number = a + 1; // Now that we are certain `a` is a number, we can use it as one.
} else {
	const b: number = a + 1; // Error.
}
```
```typescript
const a: any = "Hello";
const b: unknown = "World";

a.toLowerCase();   // This is fine since `a` is `any`.
b.toLowerCase();   // Error. We need a type check before 
```

> A useful way to think about `any` and `unknown` is: `any` means "I don't care", `unknown` means "I don't know (yet)". 

### Object Shape
An important part of using TypeScript effectively is in defining the *shape* of object values, or in other words, what properties they have and which ones must be assigned a value or are optional.
```typescript
// Let typescript infer the object shape.
// `person` will be of type: { age: number, name: string }.
const person = {
	age: 42,
	name: "Andrew"
};

// You can also explicitly specify the object type. You might do this if you want to set narrower types for the properties.
const person: { age: number, name: "Andrew" } = {
	age: 42,
	name: "Andrew"
};

// Or more cleanly, define a type:
type Andrew = { age: number, name: "Andrew" };
const person: Andrew = {...};
```
**Note**: the built-in `object` type is the set of all objects, whether it's `{}`, `{hello: "world"}`, `[]`, `new Date()`, etc. It's only slightly more restrictive than `any`.

#### Optional Properties
By default, all properties are treated as compulsory. To allow an object to not define a property, just postfix the property name with `?`.
```typescript
type Person = {
	firstName: string;
	lastName: string;	
	middleName?: string;   // Objects of type `Person` can optionally set the `middleName` property.
};
```

#### Immutable Properties
You can make properties immutable by prefixing the property name with the `readonly` property. It's like as if you declared a property as `const`, so once it's assigned for the first time, it cannot be reassigned.
```typescript
type Person = {
	name: string;
	readonly dateOfBirth: string;
};

const me: Person = { name: 'Tim', dateOfBirth: '09/03/2001' };
me.name = 'Andrew';             // This is fine.
me.dateOfBirth = '01/01/1970';  // Error.
```

#### Index Signatures
When you want the flexibility for an object to contain more arbitrary properties with a certain key-value pair type, you can use the index signature syntax, `[key: K]: V`, where `key` can be any name you choose.
```typescript
type FruitRatings = {
	[fruitName: string]: number;
};

const myFruitRatings: FruitRatings = {
	apple: 6,
	banana: 7,
	cherry: 9
};
```

#### Indexed Access Types
See [indexed access types](https://www.typescriptlang.org/docs/handbook/2/indexed-access-types.html). When you define a type for an object shape, if you want to access a nested part of that shape as a type, you can just use the subscript operator `[]`.
```typescript
interface Theme {
	colour: {
		mode: 'light' | 'dark';
		palette: {
			primary: ['#0000FF', '#0044FF', '#0066FF', '#3388FF'];
			secondary: ['#464646', '#616161', '#7E7E7E', '#AAAAAA'];
		};
	};
}

type ColourOptions = Theme['colour'];
type Palette = Theme['colour']['palette'];
```
Nope, you can't use the `.` operator as if you were accessing object properties.

#### keyof
The `keyof` unary operator evaluates to the union of a type's keys.
```typescript
interface Theme {
	colour: {
		mode: 'light' | 'dark';
		palette: {
			primary: string[];
			secondary: string[];
		};
	};
}

type ColourProperties = keyof Theme['colour'];              // → 'mode' | 'palette'
type PaletteProperties = keyof Theme['colour']['palette'];  // → 'primary' | 'secondary'
```
This is helpful for writing getter functions that retrieve values nested in an object:
```typescript
const theme: Theme = {
	colour: {
		mode: 'dark',
		palette: {
			primary: ['#0000FF', '#0044FF', '#0066FF', '#3388FF'],
			secondary: ['#464646', '#616161', '#7E7E7E', '#AAAAAA'],
		},
	},
};

const getPalette = (theme: Theme, palette: keyof Theme['colour']['palette']): string[] => {
	return theme['colour']['palette'][palette];
};

console.log(getPalette(theme, 'primary'));
```

### Arrays
To denote a type as an array of items of type `T`, you can do `T[]` or `Array<T>` (they're [exactly the same](https://stackoverflow.com/questions/36842158/arraytype-vs-type-in-typescript)). 
```typescript
// Array type declaration examples.
type Names = string[];
type People = { name: string; }[];
type Values = (string | number)[];
```
In general, try to keep arrays *homogenous*, that is, of a singular type, otherwise you'd have to do type-checking before TypeScript can let you use the items of the array.
```typescript
// When arrays are not homogenous, that is, of one type, you'd have to do some type checking to work with its items.
const arr: (string | number)[] = [42, "Hello"];

arr.forEach(item => {
	if (typeof item === 'number') {
		// You can use `item` as a number after you've type-checked it.
		const num = item * 3;
		console.log('Number: ', num);
	} else {
		// `item` must be a string
		const s = item + " world";
		console.log('String: ', s);
	}
})
```

Arrays are always mutable by default in TypeScript, that is, you can reassign the value at any index and invoke methods that make in-place modifications like `push` or `reverse`. To make them immutable, you would prefix them with the `readonly` modifier.
```typescript
type Names = readonly string[];
const radioheadMembers: Names = ['Thom', 'Johnny', 'Colin', 'Phil', 'Ed'];

radioheadMembers[1] = 'Tim';  // Error.
```

### Tuples
Remember, tuples are just *fixed-length arrays*. In typescript, we define a tuple by specifying the type of each item like: `[T1, T2, ...]`:
```typescript
type FullName = [string, string, string?];  // You can make items optional in a tuple, just like for objects.
                                            // Note: this is basically the same as: `[string, string] | [string, string, string]`.
const elon: FullName = ["Elon", "Reeve", "Musk"];
const jeff: FullName = ["Jeff", "Bezos"];
```
You can also make use of the [[Knowledge/Engineering/Languages/JavaScript#Rest Operator|rest operator]], `...`, to allow for tuples of arbitrary lengths.
```typescript
type FullName = [string, string, ...string[]];
const queenElizabethII = ['Elizabeth', 'Alexandra', 'Mary', 'Windsor'];
```

**Caveat**: *tuples are not immutable by default*.
Unlike in other languages like Python, the items of a tuple in TypeScript *can* be mutated, that is, reassigned after definition. To make tuples immutable, you would do the same thing as you would for making arrays immutable: prefix it with the `readonly` modifier.
```typescript
type Coordinate = readonly [number, number];
const point: Coordinate = [1, 2];

point[0] = 3;   // Error.
```

### Enums
Enums are data types that have a *fixed set* of constant values. They're a great way to group together a lot of related constants. *Note*: JavaScript doesn't have enums.
```typescript
enum Theme {
	Light,
	Dark,
	HighContrastLight,
	HighContrastDark
};

// You access the fields of the enum in the same way that you'd access an object.
const theme: Theme = Theme.Dark;
```
In the example above, every enum value gets implicitly assigned a counter value starting from 0. It's equivalent to doing the following:
```typescript
enum Theme {
	Light = 0,
	Dark = 1,
	HighContrastLight = 2,
	HighContrastDark = 3
}
```
You can also map enum keys to string values instead of integers. 
```typescript
enum Theme {
	Light = '#CCCCCC',
	Dark = '#333333',
	HighContrastLight = '#FFFFFF',
	HighContrastDark = '#000000',
}
```

#### Caveats
One annoying issue is that you can freely assign numbers to enum types that are clearly outside the bounds of the enum values.
```typescript
enum Theme {
	Light,
	Dark,
	HighContrastLight,
	HighContrastDark,
}
const theme: Theme = 6; // No complaints from TypeScript.
```
In general, the official docs advise you to avoid enums unless they help significantly with readability. Alternatives to enums include string literals, eg. `type Theme = "Light" | "Dark" | ...`, or object literals, eg. `const Theme = { Light: "Light", Dark: "Dark", ... }`.

### Type Inference
You don't have to always supply an explicit type. Often, there'll be enough context for TypeScript to figure it out without ambiguity. In general, we prefer type inference over explict assigning types to varaibles/parameters/etc. for conciseness.
```typescript
let a: number = 42;   // There is no need to do this. It's clear what type `a` is from the RHS of the assignment.
let b = 42;           // Equivalent to above, but it lets typescript assign the type implicitly.
```
This extends to functions as well, meaning that often you won't have to specify the return value.

#### Type Widening/Narrowing
An important implicit rule in TypeScript is that when you let type inference happen for `const` variables, TypeScript will assign it the *narrowest type possible* since it knows that a `const` variable cannot possibly take any other value after its defined. Otherwise, TypeScript will infer the type to be wider than it might be.
```typescript
let a = 2;    // `a` is of type `number`.
const b = 2;  // `b` is of type `2`, a specific member of `number`.
```

### typeof and instanceof
Although type checking is done for you statically, there are times when you must perform run-time type checks such as when you're fetching external data. In these times, rely on JavaScript's operators: `typeof` and `instanceof`.
1. Use the `instanceof` binary operator to check some value is of a custom type, or a complex built-in type like `RegExp`.
	- Note that `val instanceof T` works by checking if `T` exists anywhere along `val`'s [[Knowledge/Engineering/Languages/JavaScript#Prototypes|prototype chain]]. This is why you get unintuitive results when you use `instanceof` on primitive types. For example, `42 instanceof Number` is `false`, but `new Number(42) instanceof Number` is `true`.
2.  Use the `typeof` unary operator to check some value is some built-in primitive type such as `undefined`, `number`, `string`, `boolean`, etc.

### Type Assertions
When you're confident that some value should be a certain type but TypeScript isn't, you can make a type assertion with the `as` keyword. 
```typescript
let someVal: any = 123;

// Here, you're basically telling TypeScript: "I am 100% sure this is a number. Trust me."
const val = someVal as number;
```
You can also make type assertions by prefixing an expression with `<T>`, eg. `<Person>person` which is exactly the same as `person as Person`.
> Aim to minimise your usage of type assertions like above. They're considered 'escape hatches' from the language and can prevent you from maximising the benefits of using a type system.

#### Const Assertion
Use `as const` to tell TypeScript to infer the value to its narrowest possible type.
```typescript
const a = [1, 2, 3];           // → Type: `number[]`
const b = [1, 2, 3] as const;  // → Type: `readonly [1, 2, 3]`
```

#### Nonnull Assertion
When you're confident a value is not null, you can postfix that value with `!` to assure TypeScript. If you cannot be confident, then just use a standard null-check: `if (_ === null) ...`.
```typescript
type NullableString = string | null;
const s: NullableString = 'Hello';

// This is basically saying: "Don't worry TypeScript, I'm 100% sure `s` is not null."
console.log(s!.toUpperCase());
```

### Refinement
TypeScript's static analysis can handle *refinement* where, based on the control flow logic, TypeScript can narrow the type of the variable. Refinement can happen when you use `if`, the optional chaining operator `?.`, `||`, `switch`, `typeof`, `instanceof`, `in`, etc.
```typescript
type CssWidth = number | string | undefined;

const getPixelWidth = (width: CssWidth): number => {
	// At this point, TypeScript knows `width` is `number | string | undefined`.
	if (typeof width === 'undefined') return 0;

	// At this point, TypeScript knows `width` is `number | string`.
	if (typeof width === 'number') return width;

	// At this point, TypeScript knows `width` is `string`. We can therefore use
	// string methods on `width` with confidence.
	return Number(width.slice(0, width.search('px')));
};

console.log(getPixelWidth(undefined)); // 0
console.log(getPixelWidth(10));        // 10
console.log(getPixelWidth('480px'));   // 480
```

Refinement works with unioned objects, but it's best to use unique strings to help TypeScript infer types properly.
```typescript
interface UserTextEvent {
	type: 'TextEvent';
	value: string;
	target: HTMLInputElement;
}
interface UserMouseEvent {
	type: 'MouseEvent';
	value: [number, number];
	target: HTMLElement;
}

type UserEvent = UserTextEvent | UserMouseEvent;

const handle = (event: UserEvent): void => {
	if (event.type === 'TextEvent') {
		// At this point, TypeScript is certain that `event` is `UserTextEvent`.
		// ...
	} else {
		// At this point, TypeScript is certain that `event` is `UserMouseEvent`.
		// ...
	}
};
```
This kind of type refinement is very useful when working with [[Knowledge/Engineering/Technologies/Redux#Reducers|Redux reducers]].

#### Type Guards
Refinement doesn't work as expected when you use a function to do the type-checking. Any type-checking only contributes to refinement if it's in the same scope.
```typescript
const isString = (s: unknown): boolean => {
	return typeof s === 'string';
}

const refinementTest = (val: string | number) => {
	if (isString(val)) {
		val.toLowerCase();   // Error. TypeScript still thinks `val` is `string | number`.
		// ...
	} else {
		const num = val * 2; // Error. TypeScript still thinks `val` is `string | number`.
		// ...
	}
}
```
To fix this, you'd need to define a **type guard** which is a *predicate* function that confirms an argument is a given type. It looks like this:
```typescript
const isString = (s: unknown): s is string => {
	return typeof s === 'string';
};
```

### Variance
It's useful to think of types as just *sets*. When $A$ is a subtype of $B$, it is basically just saying that $A \subseteq B$.

*Variance*, in programming language theory, is how subtyping works for generic types. It is concerned about the idea of whether a generic type like `List<Cat>` is a subtype of `List<Animal>`.

There are 4 kinds of variance:
- *Invariance* — says that `List<T>` is not a subtype of `List<U>` regardless of whether `T extends U`.
- *Covariance* — says that `List<T>` is a subtype of `List<U>` if `T extends U`.
- *Contravariance* — says that `List<T>` is a subtype of `List<U>` if `U extends T`, ie. going the other way of covariance.
- *Bivariance* — says that `List<T>` is a subtype of `List<U>` if either `T extends U` or `U extends T`.

Every language's type system has different rules around *variance*. As a programming language designer, if you were to allow covariance or contravariance over invariance, then you're allowing for greater flexibility in the type system, but it exposes programmers to greater risk of runtime type errors.

TypeScript tends to be more relaxed by allowing functions to take in covariant arguments. For example, you can pass an argument so long as it is a subtype of the expected parameter, ie. covariant to the expected parameter, but this makes it possible to create run-time type errors like this:
```typescript
interface EngineeringStudent {
	name: string;
	discipline: string;
}
interface FirstYearEngineeringStudent {
	name: string;
	discipline?: string;   // This is basically: `string | undefined`.
}                          // This makes `EngineeringStudent` a subtype of `FirstYearEngineeringStudent`!

// Here, `student` can be `FirstYearEngineeringStudent` or any subtype of it.
const clearDiscipline = (student: FirstYearEngineeringStudent) => {
	delete student.discipline;
};

// The dangers of accepting a covariant argument:
// We can delete the non-optional `discipline` field and TypeScript will not complain.
const csStudent: EngineeringStudent = { name: 'Linus', discipline: 'Computer Science' };
clearDiscipline(csStudent);

console.log(csStudent.discipline);  // → undefined
```

## Functions
**Typing Function Declarations**
To type a function declaration, you just assign types for each parameter it takes in and then specify the return type by postfixing the parameter list with a colon and a type.
```typescript
// Typing function parameters and return values.
// To assign a return type to a function, you postfix the parameter list with a colon and a type.

// Regular functions:
function increment(num: number): number {
	return num + 1;
}

// Arrow functions:
const decrement = (num: number): number => num - 1;
```
**Typing Function Expressions or Arrow Functions**
What if you want to specify the type of a callback rather than a function declaration? You would use the syntax: `(param: Type, ...) => RetType`. Although the syntax is inspired by arrow functions, it is not actually defining a function.
```typescript
type Greeting = (a: string, b: string) => void;

// Note that the parameter names above don't need to match that of the assigned
// callback's parameter names, they're purely for documentation.
const callback: Greeting = (name, message) => {
	console.log(`Hi, I'm ${name}. ${message}`);
}
callback("Linus", "F*** you, Nvidia.");
```

### Optional & Default Parameters
Just like how you can make [[Knowledge/Engineering/Languages/TypeScript#Optional Properties|object properties optional]] and [[Knowledge/Engineering/Languages/TypeScript#Tuples|tuple items optional]], you can make function parameters optional by postfixing the parameter name with a `?`. Alternatively, you can set a default value for a parameter by assigning a value directly after the parameter name, which is pretty much the same as making it optional.
```typescript
// Optional parameter.
const greet = (name: string, message?: string) => {
	console.log(`Hi ${name}!`);
	if (message) console.log(message);
}

// Default parameter. Notice that the parameter type can often be inferred from the
// default value that you supply.
// You can also choose to explicitly set the type anyway like: 
//   `message: string = "You rock."`
const greet = (name: string, message = "You rock.") => {
	console.log(`Hi ${name}! ${message}`);
}
```

### Variadic Functions
A **variadic function** is just one that takes in an arbitrary number of arguments. The vast majority of functions take in a fixed list of parameters, we call these 'fixed-arity' functions. Normally in JavaScript, defining a variadic function requires you to make use of the implicit [`arguments`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/arguments) array in the function body. In TypeScript, it's way more intuitive and can be done in a type-safe way with the rest operator, `...`.
```typescript
const max = (...nums: number[]): number => {
	if (!nums || nums.length === 0) return -Infinity;
	return nums.reduce((maxSoFar, currNum) => (maxSoFar > currNum) ? maxSoFar : currNum, -Infinity);
}
```

### this
In JavaScript, `this` is a nightmare for most programmers to work with because its value is different depending on how it is called. In TypeScript, you can minimise surprises around the value of `this` by assigning a type to it as the first function parameter.

To illustrate the problem:
```typescript
type Person = { name: string, greet: () => void };
const person: Person = {
	name: "Linus Torvalds",
	greet: function() {
		console.log(`Hi, I'm ${this.name}`);
	}
}
person.greet(); // This works as expected since `this` is bound to `person`.

const greet = person.greet;
greet();        // This fails since the `this` is lost and is no longer bound to `person`.
```
The 'solution' is to assign a type for `this` so that the developer is warned when `this` takes on the wrong type when they invoke a function that uses it.
```typescript
type Person = { name: string, greet: (this: Person) => void };
const person: Person = {
	name: "Linus Torvalds",
	greet: function(this: Person) {
		console.log(`Hi, I'm ${this.name}`);
	}
}
```

### Generators
See [[Knowledge/Engineering/Programming/Generators|generators]]. In JavaScript, you can create a [[Knowledge/Engineering/Languages/JavaScript#Generators|generator function]] by postfixing `function` with an asterisk, `*`. *Note*: you cannot define arrow functions as generator functions (at least as of 2022's ES standard).
```typescript
function* fooGenerator() {
	yield 42;
	yield 24;
}

const fooNums = fooGenerator();
console.log(fooNums.next());    // → { value: 42, done: false }
console.log(fooNums.next());    // → { value: 24, done: false }
console.log(fooNums.next());    // → { value: undefined, done: false }

// You can loop through a generator's values with JavaScript's for-of loops.
for (const item of fooGenerator()) {
    console.log(item);
}
```
TypeScript automatically infers the return type of the generator to be `IterableIterator<number>`. To assign an explicit type for what gets yielded, do it the same way that you'd specify the return value, but wrap it around with `IterableIterator`.
```typescript
function* fooGenerator(): IterableIterator<number> {
	...
}
```

### Iterators
See [[Knowledge/Engineering/Programming/Iterators|iterators]]. In JavaScript, an *iterable* is an object containing the `Symbol.iterator` property with the value being a function that returns an *iterator* (which can be done by defining Symbol.iterator to be a [[Knowledge/Engineering/Languages/TypeScript#Generators|generator function]], which always returns an iterator). An *iterator* is an object that defines a `next` method which returns an object of shape: `{ value: any, done: boolean }`.

An object can be both an *iterable* and an *iterator* at the same time. When you invoke a generator function, for example, you get an object 
of type `IterableIterator` which is both, meaning it has a `Symbol.iterator` property, whose value is a function that returns an iterator, and the `next` method.
```typescript
const favouriteNums = {
	*[Symbol.iterator]() {
		yield 42;
		yield 2;
		yield 4;
	}
}

for (const item of favouriteNums) {
	console.log(item);
}
```
**Note**: the syntax for defining `Symbol.iterator` as a generator function might seem strange. See this post for clarifications. As for the square brackets around `Symbol.iterator`, it's called the [computed property name syntax](https://stackoverflow.com/questions/32515598/square-brackets-javascript-object-key), introduced in ES6.

### Function Overloading
You can define a function type that actually consists of multiple function signatures. See the [Function Overloads](https://www.typescriptlang.org/docs/handbook/2/functions.html#function-overloads).

## Generic Functions
See [[Knowledge/Engineering/Programming/Generics|generics]]. In TypeScript, you can define generic functions by specifying a comma-separated list of generic type parameters in angle brackets `<>` right before the parameter list of function. You would use generic functions if you wanted a function to be reusable across multiple types without giving up type safety by resorting to `any`.
```typescript
type Filter = <T>(array: T[], predicate: (elem: T) => boolean) => T[];

const filter: Filter = <T>(array: T[], predicate: (elem: T) => boolean) => {
	const arr: T[] = [];
	array.forEach((elem) => {
		if (predicate(elem)) arr.push(elem);
	});
	return arr;
};

// TypeScript can infer that `T` should be `number`.
console.log(filter([1, 2, 3, 4, 5], (num) => num % 2 === 0));

// To explicitly set `T`, use angle brackets after the function name.
console.log(filter<number>([1, 2, 3, 4, 5], (num) => num % 2 === 0));
```
To make regular function declarations generic, you also place the generic type parameters between angle brackets right before the parameter list:
```typescript
function filter<T>(array: T[], predicate: (elem: T) => boolean) => { ... }
```

### Bind on Reference
In the above example, `T` gets *bound* when the function gets invoked, but you could also bind `T` whenever the type alias gets referenced by placing the generic type parameters *after* the type name instead of before the function parameter list:
```typescript
type Filter<T> = (array: T[], predicate: (elem: T) => boolean) => T[];

// Wherever you use `Filter`, you have to explicitly bind `T` like `Filter<T>`.
const filter: Filter<number> = (array, predicate) => ...;
```

### Bounded Polymorphism
Sometimes, saying that a generic function takes in type parameter of `T` is too permissive. Instead, we might want `T` to be a subtype of `U`, that is, we should accept type parameters that are 'at least' `U`. This is called *bounded polymorphism* or *constrained genericity*.
```typescript
type Enemy = { health: number };
type Alien = Enemy & { galaxy: string };
type Cyborg = Enemy & { model: string };

type AttackEnemy = <T extends Enemy>(enemy: T, damage: number) => void;
const attackEnemy: AttackEnemy = <T extends Enemy>(enemy: T, damage: number) => {
	enemy.health -= damage;
	console.log(`Dealt ${damage}. Enemy now has ${enemy.health} HP left.`);
};

const enemy: Enemy = { health: 20 };
const alienEnemy: Alien = { health: 50, galaxy: 'Andromed' };
const cyborgEnemy: Cyborg = { health: 100, model: 'Terminator Mk. II' };

attackEnemy(enemy, 15);
attackEnemy(alienEnemy, 10);
attackEnemy(cyborgEnemy, 8);
attackEnemy("Hello world", 5);  // Fails because "Hello world" is not a subtype of `Enemy`.
```
![[Knowledge/Engineering/Languages/assets/bounded-polymorphism.png|250]]

## Object-Oriented Programming
See [[Knowledge/Engineering/Programming/Object Oriented Programming|Object Oriented Programming]].

### Access Modifiers
See [[Knowledge/Engineering/Programming/Object Oriented Programming#Encapsulation|encapsulation]]. TypeScript offers 3 access modifiers, which can be prefixed to any class field declaration:
- `private`.
- `protected` (which makes a member accessible to subclasses as well).
- `public` .
If no access modifier is specified, then fields are `public` by default, unlike most languages which default to `private`.

When prefixing a constructor's parameter with an access modifier, it'll declare the field and assign the given value implicitly. 
```typescript
class Person {
	constructor(public name: string) {}
}
// ... is a shorthand that's equivalent to:
class Person {
	public name: string;
	constructor(name: string) { this.name = name; }
}

const person: Person = new Person('Linus Torvalds');
console.log(person.name);
```

### Inheritance
See [[Knowledge/Engineering/Programming/Object Oriented Programming#Inheritance|inheritance]]. In TypeScript, inheritance works in the same way and uses the same syntax as [[Knowledge/Engineering/Languages/JavaScript#Inheritance|JavaScript's inheritance]].

### Method Overriding
See [[Knowledge/Engineering/Programming/Object Oriented Programming#Method Overidding|method overriding]]. By default, every method is '[[Knowledge/Engineering/Programming/Object Oriented Programming#Virtual Method|virtual]]', so you can override them all. To override a method in TypeScript, just copy the method signature and supply the new method body. As good practice, use the optional `override` modifier so that you're warned when you've got the base class' method signature wrong.
```typescript
class Base {
    // Methods are virtual by default.
	public foo(): void {
		console.log('Foo');
	}
}

class Sub extends Base {
    // Explicitly re-implementing the parent's `foo` method.
	public override foo(): void {
		console.log('Bar');
	}
}
```

#### Abstract Classes
See [[Knowledge/Engineering/Programming/Object Oriented Programming#Abstract Class|abstract classes]]. To make a class abstract, just prefix it with the `abstract` keyword.
```typescript
abstract class Employee { ... }
class SoftwareEngineer extends Employee { ... }
```

### Abstract Methods
See [[Knowledge/Engineering/Programming/Object Oriented Programming#Abstract Method|abstract methods]]. Abstract methods must be inside abstract classes. To make a method abstract, use the `abstract` modifier, explicitly type the method signature and do not provide a body.
```typescript
abstract class Employee {
	constructor(public salary: number) {}
	public getSalary(): number { return this.salary; }
	public abstract slackOff(): void;
}

class SoftwareEngineer extends Employee {
	constructor() { super(100000); }
	public override slackOff() { console.log('Time to browse r/ProgrammerHumor...'); }
}

const linus: Employee = new SoftwareEngineer();
linus.slackOff();
```

### Generic Types in Classes/Interfaces
You can set class-scoped or interface-scoped generic type parameters:
```typescript
class HashMap<K, V> { ... }
interface HashMap<K, V> { ... }
```


## Modules
See [[Knowledge/Engineering/Languages/JavaScript#Modules|JavaScript modules]]. With TypeScript, you can additionally import/export type aliases and interfaces.

**Note**: in import statements, you don't need to specify the `.ts` file extension. This means you can easily import [[Knowledge/Engineering/Languages/TypeScript#Type Declaration Files|type declaration files]] with the extensionless name.

In `thing.ts`:
```typescript
// Notice that this file exports a value `Thing` and a type `Thing`, but
// no name collision happens because 'values' and 'types' are tracked in
// separate namespaces by the TypeScript compiler.
export type Thing = {
	val: number;
};
export const Thing = {
	val: 42,
};
```
In `main.ts`:
```typescript
// Notice that you don't need to write the extension in the path: './thing.ts'.
import { Thing } from './thing';

const thing: Thing = Thing;
console.log(thing);
```

## Error Handling
See [[Knowledge/Engineering/Languages/JavaScript#Error Handling|JavaScript error handling]]. TypeScript doesn't introduce any new syntax for error handling over JavaScript, but the type system allows for streamlining how errors are treated in a project by developers.

### Ways of Error Handling
There are 4 common patterns for handling errors in TypeScript projects, which are also mostly applicable to non-TypeScript projects:
1. *Just return `null`.*
   This reveals the least information in the event of an error, but it's the easiest to do. Constant null-checking is required throughout the code however, which can be laborious and verbose.
2. *Throw an exception.*
   When an exception is thrown, it must be caught by the caller in a try-catch block (or a `catch` callback if using promises) otherwise a full crash occurs. Making and throwing custom subclasses of `Error` would offer specific information to help with debugging and informing the user about the problem.
   The main issue is that it's hard to enforce that programmers write the error-handling try-catch logic when they're lazy.
3. *Return exceptions (rather than throw them)*.
   This means a function will specify in its return type a union of the expected return type *and* the error classes that it could throw, such as in the following:
   ```typescript
	const getData = (): Data | NetworkError => {};
   ```
   By putting the error as part of the return type, the user of the function is unlikely to ignore error cases.
   The idea here is very similar in spirit to [Java's `throws`](https://www.javatpoint.com/throws-keyword-and-difference-between-throw-and-throws) keyword.
   The downside to this approach is that it'll lead to more verbose function signatures, especially if errors are simply 'bubbled' up the call stack.
4. *Define and use the `Option` type*.
  The idea comes from languages like Rust and Haskell. See Rust's documentation on [`std::option`](https://doc.rust-lang.org/std/option/).

## Utility Types
TypeScript gives you a bunch of [very useful built-in utility types](https://www.typescriptlang.org/docs/handbook/utility-types.html) that you can use to make working with complex types a breeze 🌬️.

### Mapping Types
Here are some of the most useful utility types for sourcing types from other types:
- `Partial<T>` — T, but every property is optional.
- `Omit<T, Keys>` — T, but without the property in `Keys`, which is a union of string property names.
- `Pick<T, Keys>` — a type with properties `Keys`, a union of string property names, sourced from `T`.
- `Readonly<T>` — T, but every property is read-only.

Usage examples:
```typescript
interface Human {
    limbs: string[];
    organs: string[];
    memories: string[];
    soul: boolean;
}

type SubHuman = Partial<Human>;                                 // Human, but all properties are optional.
type Husk = Omit<Human, 'soul' | 'memories'>;                   // Human, but without the soul or memories.
type SentimentalProperties = Pick<Human, 'soul' | 'memories'>;  // Only the soul and memories of a human.
type FrozenHuman = Readonly<Human>;                             // Human, but every property is immutable.

// After experiencing Java programming, I am just a husk ;(
const me: Husk = {
    limbs: ["arms", "legs", "..."],
    organs: ["half a brain", "heart", '...'],
};
```

**Note**: behind the scenes, utility types such as the ones above are realised through ['mapped types'](https://www.typescriptlang.org/docs/handbook/2/mapped-types.html).
```typescript
// This is the `Partial` type, implemented using mapped types.
// Many other utility types are implemented in a very similar manner!
type MyPartial<T> = {
    [K in keyof T]?: T[K];
};
```

### Conditional Types
Here are some of the most useful utility types that leverage [conditional typing](https://www.typescriptlang.org/docs/handbook/2/conditional-types.html), a TypeScript innovation.
- `Exclude<T, U>` — removes values in the set `U` from the set `T`.
- `Extract<T, U>` — picks out elements in `U` that are in `T`.
- `NonNullable<T>` — excludes `null` from the set `T`.
- `ReturnType<F>` — the return type of a function's typed signature.

**Note**: just like how you can use the ternary operator, `(condition) ? expr1 : expr2` for conditional expression evaluation, you can use the ternary operator for conditional type evalution. This is what's used to implement those conditional utility types above.

## Asynchronous Programming
See [[Knowledge/Engineering/Languages/JavaScript#Asynchronous Programming|JavaScript asynchronous programming]]. 

## JavaScript Interoperability
An excellent reason to adopt TypeScript is that you don't have to rewrite your JavaScript codebase to begin benefiting from a type system.

### Type Declaration Files
A type declaration file, which goes with the extension `.d.ts`, associates types to JavaScript code. It's a file consisting **only** of *type-level* code, meaning you can't use expressions in there (which means no function implementations, variables, class implementations, etc. can be defined within). As a very loose analogy, `.d.ts` files are kind of like the `.h` header files in C or C++.

If you have a `hello-world.js` file, then the type declaration file must have the name, `hello-world.d.ts`.

> A type declaration is a way to tell TypeScript, “There exists this thing that’s
defined in JavaScript, and I’m going to describe it to you.” (Programming TypeScript). 

NPM packages that once were intended only for JavaScript developers (eg. jQuery) can be made consumable by TypeScript developers by having these type declaration files. As a TypeScript dev, you'd be able to use pure JS libraries as if they were written in TypeScript.

When type declarations don't ship with an NPM package, they can usually be install individually in the [@types organisation](https://www.npmjs.com/~types) on npm. The type declarations in [DefinitelyTyped](https://github.com/DefinitelyTyped/DefinitelyTyped), a big community effort to bring types to popular JS libraries, are automatically published to the @types organisation.

Eg. to bring jQuery into a TypeScript frontend project, you'd do:
```bash
npm install jquery --save              
npm install @types/jquery --save-dev  # Brings in all the type declaration files.
```


