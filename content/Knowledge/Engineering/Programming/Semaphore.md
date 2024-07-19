---
title: Semaphores
---

A semaphore is something that only one thread can own. It's used to coordinate access to a shared resource by forcing threads to first acquire the semaphore before accessing the resource. If a thread sees that the semaphore has already been acquired, then it must wait for it to be unlocked by the thread that is currently holding it.
