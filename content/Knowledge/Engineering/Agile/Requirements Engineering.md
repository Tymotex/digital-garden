---
title: Requirements Engineering
description: Requirements Engineering
---

### Software Requirement Specification (SRS)
A *software requirement specification* is a document, written for engineers and stakeholders alike, that describes what the project's features are and its business model. 

Generally, a requirements document should cover:
1. Project scope (a summary of what the project is, its features, its target audience, its boundaries, deliverable deadlines, etc.).
2. [[Knowledge/Engineering/Agile/Requirements Engineering#Functional Requirements|Functional requirements]] in the form of [[Knowledge/Engineering/Agile/Agile#Epic|epics]] and [[Knowledge/Engineering/Agile/Agile#User Stories|user stories]].
3. System architecture.
4. UI prototype.
5. [[Knowledge/Engineering/Agile/Requirements Engineering#Non-Functional Requirements|Non-functional requirements]].

Communication should be the priority, not formality, so you should make liberal use of diagrams, graphs and images.

### Functional Requirements
Functional requirements are product features that are implementable by developers. They define **what the system does** and roughly look like the following:
1. Authentication system allows user to log in with their Google account.
2. The user can create new blogs.
3. The user can comment on existing blogs.

### Non-Functional Requirements
Non-function requirements are requirements on the product that aren't features. They roughly look like this:
- Must support 10000 concurrent users.
- Latency must be below 100ms.
- The bundle size must be below 1mb.
