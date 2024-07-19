---
title: State Management
description: State Management
---

*State*, in this context, is just the read/write data that a UI project like a React app needs. State management is about avoiding making a mess of this data when you have a complex component hierarchy with some distantly related components that need to read/modify the same part of state.

Suppose you have an app whose component hierarchy looks like this:
![[Knowledge/Engineering/Technologies/assets/example-app-hierarchy.png|400]]
Without a state management framework, if you wanted to make it so that the `AddBlogBtn` adds a new blog that is then rendered in `BlogList`, you'd have to bubble up the event up to a common ancestor of `AddBlogBtn` and `BlogList` and then have new props be passed down to `BlogList`.

![[Knowledge/Engineering/Technologies/assets/example-app-without-state-management.png|400]]

In this example, it's not so bad, but when the component hierarchy is much larger (which it often is in practice), then the 'sharing' and manipulation of common state between very distant relatives in the component tree quickly becomes complex because you'd have to pass data through many layers, across components that don't actually need that data, just to get that data to the component that needs it which is further down in the tree. This problem is called ['prop drilling'](https://kentcdodds.com/blog/prop-drilling). This is a very common problem in UI projects and so there exists many different strategies for avoiding this, each with their own tradeoffs to consider (which usually include short-term productivity vs. long-term productivity, elegance vs. comprehensiveness, etc.).

Broadly, those strategies are:
- Flux (eg. through [Vuex](https://vuex.vuejs.org/)).
- [[Knowledge/Engineering/Technologies/Redux|Redux]] (eg. through [React Redux](https://react-redux.js.org/)).
- [React Context](https://reactjs.org/docs/context.html).

Redux, for example, centralises the app's state by extracting out all the main parts of state into a global 'store' and allows all components, regardless of where they are in the hierarchy, to read/write to that store. Any updates to the shared global state made by one component are immediately 'received' by other components dependent on the part of the global state that was updated.
![[Knowledge/Engineering/Full-Stack/assets/redux-example.png|400]]


