---
title: Vue.js
description: Vue.js
---

![[Knowledge/Engineering/Technologies/assets/vue-wallpaper.png|600]]

Vue.js is a [[Knowledge/Engineering/Languages/JavaScript|JavaScript]] framework for building sophisticated UI components in a reusable, maintainable and performant way. Just like for React, there's a rich ecosystem of npm packages you can plug in to have things like: unit testing, static site generation, client-side routing, state management, etc.

## Setup
Just run the following.
```bash
npm init vue@latest  # Invokes `create-vue` which presents a terminal menu
                     # with prompts to help set up your project.
```

## Core Things to Know
This section contains all the main things to know to be able to work on a Vue project.

### Writing Components
Components are defined in a single `.vue` file. Vue provides a template syntax that extends regular HTML.
```vue
<script>
export default {
    data() {
        return {
            message: "Hello world",
        };
    },
    methods: {
        handleClick() {
            this.message = "Goodbye world";
        },
    },
};
</script>

<template>
    <h1 v-on:click="handleClick">{{ message }}</h1>
</template>
```
You can embed any javascript expression inside the double braces, eg. `{{ 42 + Math.PI }}`

#### Props
Just like React components, every Vue component can take in props.
```vue
<script>
export default {
    props: {
        message: String,
    },
};
</script>

<template>
    <div>{{ message }}</div>
</template>
```

#### V- Directives
Directives start with `v-` and are introduced by Vue's template syntax. See the [full list of built-in directives](https://vuejs.org/api/built-in-directives.html).
- **Attribute/Prop binding** with `v-bind`, or the short-hand `:`.
	```vue
	<div v-bind:class="activeClass">Hi</div>
	<div :class="activeClass">Hi</div>       <!-- You can optionally omit v-bind and just use a colon
	                                              since attribute binding is so frequently used. -->
	```
- **[Conditional rendering](https://vuejs.org/guide/essentials/conditional.html)** with `v-if`, `v-else-if` and `v-else`. Whenever you use these, the elements must be consecutive siblings.
	```vue
	<script>
	export default {
	    data() {
	        return {
	            isDarkMode: false,
	        };
	    },
	    methods: {
	        toggleDarkMode() {
	            this.isDarkMode = !this.isDarkMode;
	        },
	    },
	};
	</script>
	<template>
	    <div v-if="isDarkMode" @click="toggleDarkMode">🌙</div>
	    <div v-else @click="toggleDarkMode">☀️</div>
	</template>
	```
- **[List rendering](https://vuejs.org/guide/essentials/list.html)** with `v-for`. 
	```vue
	<template>
	    <ul v-for="message in ['Hello', 'World']">
	        <li>{{ message }}</li>
	    </ul>
	</template>
	```
- **Event listeners** with `v-on`, or the short-hand `@`.
	```vue
	<script>
	export default {
	    methods() {
	        handleClick: () => console.log('Hi');
	    }
	}
	</script>
	<template>
		<button v-on:click="handleClick">Hi</button>
	</template>
	```
	Combining `v-bind` and `v-on` lets you have *two-way data binding* where changes to the UI will change the state, and changing the state will change the UI. Alternatively you can use `v-model`.
- **Two-way data binding** with `v-model`. It's just syntactic sugar around `v-bind` and `v-on` for creating two-way [form bindings](https://vuejs.org/guide/essentials/forms.html).
	```vue
	<script>
	export default {
	    data() {
	        return {
	            email: "",
	        };
	    },
	};
	</script>
	
	<template>
	    <input v-model="email" />
	    <span>Value: {{ email }}</span>
	</template>
	```

#### Computed Properties
When you want to interpolate values inside the component but the expression is complex, you should extract it out into a *computed property*.
```vue
<script>
export default {
    data() {
        return {
            val: 0,
        };
    },
    computed: {
        isEven() {
            return this.val % 2 === 0;
        },
    },
};
</script>
<template>
    <input type="number" v-model="val" />
    <p v-if="isEven">I'm even</p>
    <p v-else>I'm odd</p>
</template>
```

#### Lifecycle Hooks
Just like React components, Vue components undergo a similar [lifecycle](https://vuejs.org/api/options-lifecycle.html) consisting of creation, mounting, updating and unmounting.
```vue
<script>
export default {
    beforeCreate() { alert("Before creation"); },
    created() { alert("Created!"); },
    beforeMount() { alert("Before mounting"); },
    mounted() { alert("Mounted!"); },
};
</script>
<template>
    <div style="background: black; width: 200px; height: 200px"></div>
</template>
```

#### Refs
Just like React, you can attach a reference to an element and then access and manipulate it after it's been mounted.
```vue
<script>
export default {
    mounted() {
        this.$refs.animal.innerHTML = "🐕 dogs are better";
    },
};
</script>

<template>
    <div ref="animal">🐈 cats are better</div>
</template>
```

#### Emits
Unlike React, you can make the child trigger events on the parent directly by emitting an event from the child which hits an event handler in the parent.
```vue
<!-- ChildComponent.vue -->
<script>
export default {
    methods: {
        notifyParent() {
            this.$emit("someEvent", "Hello World!!!");
        },
    },
};
</script>
<template>
    <button @click="notifyParent">Click me</button>
</template>

<!-- Then in the parent component, you add an event listener for 'someEvent' -->
<ChildComponent @someEvent="..." />
```

### Styling
Broadly, there are 2 approaches to applying CSS to Vue components.
1. Add a `<style scoped>` to the .vue file where the CSS within applies only to that component. You could omit the `scoped` prop to apply styles globally. For SCSS, you can set the prop `lang="scss"`.
2. Include a .css file from somewhere in the project directory through `<style scoped>@import '...'</style>` or use an ES `import '___.css'`.

## Vuex
See [[Knowledge/Engineering/Full-Stack/State Management|state management]].

Vuex, designed after the [Flux](https://facebook.github.io/flux/docs/in-depth-overview/) and [[Knowledge/Engineering/Technologies/Redux|Redux]] state management frameworks, introduces a *single source of truth* to the app that any component can read/write to.

