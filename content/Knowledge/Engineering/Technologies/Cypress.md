---
title: Cypress
description: Cypress is an integration testing library for testing web apps.
---

![[Knowledge/Engineering/Technologies/assets/cypress-wallpaper.png|500]]

Cypress is an [[Knowledge/Engineering/Testing/End To End Testing|end-to-end testing]] library for testing the entirety of a web app, including its frontend and backend, in a way that closely simulates how real users would use the app. It also has an API for writing [[Knowledge/Engineering/Testing/Integration Testing|integration tests]] and [[Knowledge/Engineering/Testing/Unit Testing|unit tests]]. 

Cypress tests aim to simulate the user experience as closely as possible. This means that tests you write will usually start up a real browser process, navigate to the URL of your web app, then execute a series of user interactions (eg. clicking on links, buttons, sending keystrokes, etc.) and let you make assertions on how the document should respond and what its contents should have.

The purpose of end-to-end testing this way is to give you confidence that the user can perform critical actions without error. For example, you might have a test that verifies your web app's authentication system, the purchase of an item, the sending of a message, etc. Unit tests with [[Knowledge/Engineering/Technologies/Jest]], for example, wouldn't be sufficient for that purpose.

### Writing Tests
In general, the [[Knowledge/Engineering/Testing/Arrange, Act, Assert|arrange, act, assert]] pattern for writing unit tests is also a useful way to structure e2e Cypress tests.

#### Example
A simple test suite I wrote for my portfolio website.
```typescript
describe("Portfolio page tests", () => {
    beforeEach(() => {
        // A wait exists just to allow for page-load animations to complete.
        cy.visit("/").wait(1000);
    });

    it("should render the about page after the 'about' link is clicked", () => {
        // Click 'About' from the homepage.
        cy.contains("About").click().wait(1000);

        // The window should show and the URL should change.
        cy.url().should("include", "/about");
        cy.contains("Who am I?");
    });

    // ...
});
```
**Note**: `describe` and `it` are sourced from [Mocha](https://mochajs.org/) and `expect` is sourced from [Chai](https://www.chaijs.com/), two core dependencies of Cypress. Also, Mocha provides `context` which is just an alias for `describe`.

### API
See [Cypress API Documentation](https://docs.cypress.io/api/table-of-contents). You'll be frequently chaining many methods together in a single statement.
- Methods like `cy.get` return a DOM element that can be further chained with methods like `type`, `click`, `contains`, etc.
- Some methods like `cy.clearCookies` do not yield anything that you can chain further methods on.

**Top-Level Methods**
```typescript
cy.visit(url)
cy.get(cssSelector)    // This works just like jQuery's `$()` selector. In fact, jQuery is one of Cypress' dependencies.
cy.url()               // Gets the current URL as a string.
cy.wait(milliseconds)

cy.wrap(subject)       // Yields the given subject. Useful for resolving promises or repeating tests using the same
                       // array containing test data.
```
**Note**: all of these `cy.*` statements execute asynchronously.

**Chained Methods**:
```typescript
.then((elem) => ...)        // You can access the 'subject' inside `then`. You'd chain this with `cy.get`, for example.
.should(chainer: string)    // Make an assertion. 
.and(chainer: string)       // An alias for `should`.

// Input methods:
.type(text: string)
.submit()
.click()
```
The `chainer` argument is a stringified *chainer* from [Chai](https://docs.cypress.io/guides/references/assertions#Chai), [Chai-jQuery](https://docs.cypress.io/guides/references/assertions#Chai-jQuery), [Sinon-Chai](https://docs.cypress.io/guides/references/assertions#Sinon-Chai), which are dependencies of Cypress.

### Aliases
You must always chain commands off of an invocation on `cy.*` otherwise commands won't be properly enqueued. Eg. if you're doing `const elem = cy.get(...); elem.then(...)`, then you need to use an alias instead, as shown below.
```typescript
cy.get('.blog').as('blog');  // Create the 'blog' alias.
cy.get('@blog');             // Retrieve the subject that 'blog' is assigned to.
```

### Fixtures
In Cypress, *fixtures* are a collection of static test data that can be used by tests. They're located at `cypress/fixtures` and are typically .json files, but can also be .js, image files, etc. The common usage of fixtures is in [[Knowledge/Engineering/Technologies/Cypress#Mocking Network Requests|stubbing network requests]].

```typescript
// Loads `cypress/fixtures/blogs.json` and uses it as the response
// when an API endpoint is hit.
cy.fixtures('blogs').as('blogsJson').then((blogs) => {
	cy.intercept('GET', '/blogs', blogs);
})
```

### Reusuable Custom Commands
Cypress gives you many useful [[Knowledge/Engineering/Technologies/Cypress#API|commands]], however you might need some custom reusable helper functions to help with stubbing network requests, for example. You define custom helpers in `cypress/support/commands.ts` by doing the following:
```typescript
Cypress.Commands.add("helperName", () => {
	// ...
});
```
This makes your helpers available under the `cy` object, eg. from the above example, we'd be able to access `cy.helperName()` from any test.

### Mocking Network Requests
Often, you'll want to test the frontend independently of the backend, that is, you might not actually want your frontend to make requests to your backend server. You can do this by stubbing API requests with responses using [`cy.intercept`](https://docs.cypress.io/api/commands/intercept).
```typescript
cy.intercept('GET', '/blogs', [{ ... }, { ... }])
```

#### Tradeoffs
When you stub network requests, you're no longer writer 'true' end-to-end tests. Your tests are more isolated and generally less flaky since it has fewer points of failure, however you are straying away from testing the real user experience.

If you write true end-to-end tests, then:
- If you have a database, you'd have to seed it to generate state.
- Tests are possibly much slower since they'll actually go through the full backend request-handling logic.
- It'll be hard to test for edge cases like network failure.

It's recommended to maintain a balance of both stubbed tests and true end-to-end tests (especially for the *critical user actions* in your application like authentication).

### Seeding the Database

### Cypress CLI
The Cypress package ships with a powerful CLI. [Official reference](https://docs.cypress.io/guides/guides/command-line).

Some basic commands to know and consider adding to the NPM scripts inside `package.json`:
```bash
cypress open                                       # Opens Cypress' Electron binary.
cypress run --headed --no-exit --browser chrome    # Opens a Chrome browser to run Cypress tests.
cypress run --browser chrome                       # Runs Cypress tests in a headless Chrome process.
```

### Cypress CI
I used the GitHub Actions workflow YAML file [provided by the official docs](https://docs.cypress.io/guides/continuous-integration/github-actions) to run Cypress in a CI pipeline.
