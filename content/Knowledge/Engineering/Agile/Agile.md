---
title: Agile
description: Agile
---

Agile is a *philosophy* for project management that is particularly useful for software engineering teams. An alternative to Agile is the [[Knowledge/Engineering/Agile/Agile#Waterfall Methodology|Waterfall approach]].

There exists 'implementations' of Agile, which are called ***Agile methodologies***, such as:
- [[Knowledge/Engineering/Agile/Scrum|Scrum]]
- [[Knowledge/Engineering/Agile/Kanban|Kanban]]
- [[Knowledge/Engineering/Agile/Extreme Programming|Extreme programming (XP)]]

Agile has an old [[Knowledge/Engineering/Agile/Agile#Agile Manifesto|manifesto]] created by bunch of highly respected software engineers in 2001 due to frustrations over inefficient traditional project management methods (mainly [[Knowledge/Engineering/Agile/Agile#Waterfall Methodology|the waterfall approach]]). Overall, Agile puts great emphasis on:
1. Constantly launching small sets of features and using the feedback to inform the next set of features to be developed and shipped.
2. The idea that requirements and plans are constantly in flux, so we must crunch down our iteration timeline to respond quickly to those changes.

### Waterfall Methodology
In the traditional 'waterfall' approach to project management, teams plan out everything first, then execute on the plan. Essentially, everything is done in phases which collectively span a long time.

![[Knowledge/Engineering/assets/waterfall-methodology-diagram.png|500]]

The waterfall approach is named such because you cannot go to a previous phase, at least not in the short-term. It's a great management framework for projects that have fixed and clear requirements and a clear vision of what the end product will be. Sadly, software projects are rarely like that and benefit greatly from very quick development, deployment and feedback cycles which help the team re-orient the project scope so as to maximise the value delivered to customers.





![[Knowledge/Engineering/assets/agile-meme.png|500]]


### Epics
Epics serve as a container for [[Knowledge/Engineering/Agile/Agile#User Stories|user stories]] and do not represent something that's deliverable in a single sprint, usually. They go by the same format of: *"As a `userType`, I want `some behaviour`, so that `some reason`."*

![[Knowledge/Engineering/assets/epic-user-story-task-hierarchy.png|700]]

Epics are the starting point. You come up with the epics first, then recursively break it down into its constituent user stories.

### User Stories
User stories are statements of the following form:
```
As a      {user type}
I want to {use some feature in some way}
So that   {goal or benefit to the user}
```

It's worded this way to be extremely straightforward to technical/non-technical people, capture business value, and it does not assert anything about what the design should be.

User stories are usually placed into a project backlog in a project management app like Jira.

#### User Acceptance Criteria
User stories should have a concrete set of conditions that must be satisified in order to consider a user story *implemented*. This is the *user acceptance criteria*.

You can specify a user acceptance criteria with the given-when-then format:
```
Given {context}
When  {a specific action is performed}
Then  {a set of consequences should occur}
```

#### Examples

- **For a music app like Spotify:**
	- "As a user, I want to be able to make a playlist of my favourite songs so that I can find them easily."
	- "As a user, I want to follow artists so that I can be notified of new songs."

## Agile Manifesto
Sourced from [manifesto](https://agilemanifesto.org/principles.html):
1. Our highest priority is to satisfy the customer through early and continuous delivery of valuable software.
2. Welcome changing requirements, even late in development. Agile processes harness change for the customer's competitive advantage.
3. Deliver working software frequently, from a couple of weeks to a couple of months, with a preference to the shorter timescale.
4. Business people and developers must work together daily throughout the project.
5. Build projects around motivated individuals. Give them the environment and support they need, and trust them to get the job done.
6. The most efficient and effective method of conveying information to and within a development team is face-to-face conversation.
7. Working software is the primary measure of progress.
8. Agile processes promote sustainable development. The sponsors, developers and users should be able to maintain a constant pace indefinitely.
9. Continuous attention to technical excellence and good design enhances agility.
10. Simplicity — the art of maximising the amount of work not done — is essential.
11. The best architectures, requirements, and designs emerge from self-organising teams.
12. At regular intervals, the team reflects on how to become more effective, then tunes and adjusts its behaviour accordingly.

The Agile Manifesto is declarative, not imperative. It doesn't tell you how to do anything, it's up to you to apply their principles. You can do that through [[Knowledge/Engineering/Agile/Scrum|Scrum]], [[Knowledge/Engineering/Agile/Kanban|Kanban]], etc. or combining practices you like from any of them.
