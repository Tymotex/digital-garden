---
title: End To End Testing
description: End To End Testing
---

End-to-end (e2e) tests are tests that aim to simulate the user experience as closely as possible and will look almost like manual testing, but automated.

Although end-to-end tests are immensely valuable, it's worth considering reasons why you might not want to write them:
- They're slow to write and slow to run. It'll take a lot of valuable engineering time to write out e2e tests, and it'll consume valuable seconds of a cloud CI server that you're paying for.
- They're often a lot more *brittle* than integration tests or unit tests, meaning that if your application requires some minor or major change, it might mean tweaking your e2e tests. This complicates software maintenance.

In general, only invest more resources into e2e tests when you've extracted most of the value from the tests lower in the Agile 'testing pyramid':
![[Knowledge/Engineering/Testing/assets/testing-pyramid.png|300]]
*[Image source](https://www.ministryoftesting.com/dojo/lessons/the-mobile-test-pyramid)*.

