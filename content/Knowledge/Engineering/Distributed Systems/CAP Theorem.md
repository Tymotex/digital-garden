---
title: CAP Theorem
---

CAP theorem states that a distributed system can only have 2 of the following hold true:
1. **C**onsistency — every node has the most recent data. I.e. if you pick any node, you will see all of them report the same data.
2. **A**vailability — every request is fulfilled.
3. **P**artition tolerance — the system continues operating when some nodes can't communicate with each other.
    - A **network partition** is when the communication between nodes break down and form two separate networks.

Put simply, the CAP theorem states that when a *network partition* happens, you must choose either *consistency* or *availability*, but never both, until the network partition is resolved.
- Either you allow updates to nodes, forfeiting consistency.
- Or you disallow updates to nodes, forfeiting availability.
![[Knowledge/Engineering/Distributed Systems/assets/cap-theorem-dilemma.png|500]]
(sourced from [ByteByteGo](https://www.youtube.com/watch?v=BHqjEjzAicA&ab_channel=ByteByteGo))
