---
title: Nuxt.js
description: Nuxt.js is a production-ready Vue.js framework that also provides excellent developer experience.
---

![[Knowledge/Engineering/Technologies/assets/Nuxt.js-logo.png|300]]

Nuxt.js is a production-ready Vue.js framework that also provides excellent developer experience. It's inspired by [[Knowledge/Engineering/Technologies/Next|Next.js]], hence the naming, and exists for a similar purpose as Next.js but does a few things differently.

Notable features of Nuxt.js:
- *Auto-importing*, where every file has access to every component, meaning you never have to import a component again.
- Automatic [[Knowledge/Engineering/Programming/Code Splitting|code splitting]].
- Ships with pre-configured packages like [Vuex](https://vuex.vuejs.org/), [Vue Router](https://router.vuejs.org/) and [vue-meta](https://vue-meta.nuxtjs.org/). 
- Gives you a standard folder structure with special purposes associated with each folder. For example, the `pages/` directory gives you filesystem routing where each of the `.vue` files inside are mapped into web pages, similar to what Next.js does.
- Nuxt.js uses [Nitro](https://v3.nuxtjs.org/guide/concepts/server-engine/), a server-side program that enables you to use [[Knowledge/Engineering/Full-Stack/Static Site Generation|SSG]], use [[Knowledge/Engineering/Full-Stack/Server-Side Rendering|SSR]], build APIs, deploy to the [[Knowledge/Engineering/Cloud/CDNs|edge]], etc. You can still opt for a pure [[Knowledge/Engineering/Full-Stack/SPAs|SPA]].

---

## Setup
Nuxt.js has a `create-vue-app` CLI that sets up everything.
```bash
npx create-nuxt-app <project_name>
yarn create nuxt-app <project_name> 
```

## Core Things to Know
This section contains a tl;dr of basic things to know to work with Nuxt.js projects.

### Directory Structure
The basic directory structure is pretty similar to that of Next.js.
```bash
.
├── components/       # All your UI components live here. They're always available through Nuxt.js' auto-import.
├── pages/            # Filesystem routing. Every .vue file here becomes available at a client-side URL with the corresponding path.
├── static/           # Publicly accessible unchanging content.
├── store/            # For Vuex.
├── test/             # For unit tests.
└── nuxt.config.js    
```
