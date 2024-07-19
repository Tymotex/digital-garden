---
title: Microservice
description: Microservice
---

*Microservice architecture* aims split off an application's set of functionalities into small, specialised [[Knowledge/Engineering/Cloud/SaaS|services]] that run inside [[Knowledge/Engineering/DevOps/Containers|containers]]. In this architecture, "*change is a first-class design consideration*" (from the 'Fundamentals of Software Architecture').

Microservice architectures try to solve scaling challenges faced by [[Knowledge/Engineering/Architecture/Monolith|monolithic]] applications.
- When some functionality in your monolithic app receives significantly more traffic than another, you can't really scale that functionality up independently. You'd have to deploy another instance of your whole monolithic app. In microservice architectures, when service $A$ is experiencing a lot of traffic, you simply spawn another instance of service $A$.
- If your monolithic app is written in Java, then new functionalities must also be written in Java. 
- When the codebase for your monolithic app is huge and everything is deeply intertwined with each other like spaghetti, it's harder for developers to add new things, fix bugs and maintain. In microservice architectures, the services are separated by and communicate through well-defined abstractions so developers can specialise in a smaller part of the overall application.
- Failures in one part of the monolithic app might just crash the whole system. In microservice architectures, failures in one service are isolated to that service.
- If you update one part of a monolithic app, the entire app needs to be re-released, basically. In microservice architectures, every service can go through an independent CI/CD pipeline and updates to services are independent of one another.

In essence, microservice architecture is just a way of decoupling the parts inside a monolithic architecture.
