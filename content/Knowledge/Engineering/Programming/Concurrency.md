---
title: Concurrency
description: Concurrency
---

TODO:
concurrency vs. asynchronous
concurrency vs. multithreading
concurrency vs. parallelism

When talking about concurrency issues, it often involves concurrent access to the same shared data in memory, however, it can involve concurrent access to other resources such as files and databases.

*Concurrency* and *parallelism* have very similar meanings in English, but there is a distinction to be clarified about their meanings in computer science contexts:
1. **Concurrency** is just when 2+ parts of the code of a program **can** run at the same time on different cores of a CPU, different CPUs of a computer, or different computers connected to each other. 
2. **Parallelism** is when they **do** run at the same time.

> "Concurrency is a software mechanism, and parallelism is a hardware concern." - *Pragmatic Programmer*.


TODO:
Critical region.

See [[Knowledge/Engineering/Programming/Actors|actors]]

See [[Knowledge/Engineering/Programming/Mutex|mutex]].

See [[Knowledge/Engineering/Programming/Semaphore|semaphores]].
