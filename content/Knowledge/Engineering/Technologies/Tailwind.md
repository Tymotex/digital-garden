---
title: Tailwind
description: Tailwind
---

![[Knowledge/Engineering/Technologies/assets/tailwind-wallpaper.png|700]]

With Tailwind, you style elements by applying a bunch of pre-written [utility classes](https://tailwind.build/classes), minimising the amount of [[Knowledge/Engineering/Languages/CSS|CSS]] you have to write and maintain. Tailwind doesn't give you a bunch of styled components like UI libraries such as Bootstrap or Material UI. You must be proficient with CSS — Tailwind is like a CSS power user's tool, not a crutch.

**How do you memorise all the utility classes?** You don't. You pick up on the shorthands like `m-*` and `p-*` for margin and padding respectively, `bg-*` for background, and so on, and then you let intellisense do the work.

**How does Tailwind affect bundle size?** Tailwind barely affects bundle size since all the utility classes that are unused are simply [[Knowledge/Engineering/Full-Stack/Tree Shaking|tree-shaken]]. The final CSS file, after build, is usually less than 10kB.

---

## Utility Classes
Some useful utility classes at a glance. See the [full reference](https://tailwind.build/classes).
- *max-width*: `max-w-*`
- *padding*: `p-*`, `px-*`, `py-*`, `pl-*`, `pt-*`, `pr-*`, `pb-*`
- *margin*: `m-*`, `mx-*`, `my-*`, `ml-*`, `mt-*`, `mr-*`, `mb-*`
- *background*: `bg-*`
- *border*: `border-*`
- Font styles and text color: `text-*`
- **Flexbox**: `flex-*`, `justify-*`, `items-*`, and so on.
- **Responsive design**:
	- `container`
	- `sm:___` where you can apply any utility class after the colon, like `bg-blue-400`. The available breakpoints are `sm, md, lg, xl`, but they're customisable

### Custom Utility Classes
You can write your own utility classes if you're finding the same set of utility classes constantly being applied together. For example:
```css
.my-btn {
	@apply p-4 font-bold rounded;
}
```

## Configuration
Tailwind's utility classes are very unopinionated. To apply broad styling, you can run `npx tailwind init` to get a `tailwind.config.js` file where you can define some styles that should apply to certain utility classes.

For example, the `container` utility class doesn't center itself by default. You can make that the case by having the following config:
```node
module.exports = {
    purge: [],
    darkMode: false,
    theme: {
        container: {
            center: true,
        },
    },
    variants: {
        extend: {},
    },
    plugins: [],
}
```
