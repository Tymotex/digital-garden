---
title: Distributed System
---

![[Knowledge/Engineering/Distributed Systems/assets/beehive.png|700]]

Distributed systems are basically a bunch of computers trying to work together to accomplish some goal or maintain some service. All those computers and connected together through a network and will send data amongst themselves to coordinate actions.

Distributed systems are the answer to the many production problems faced by single-machine systems:
- **Horizontal scalability** — need more compute power or storage? Just add another node to the system.
- **Fault tolerance** — removing that single point of failure means some of your machines can die and the system will still be able to do its job.
- **Performance** — you can divide and conquer by running algorithms in parallel on all your nodes to make massive compute jobs complete very quickly.
- **Geographical distribution** — if you want your service to be very low latency for everyone, there is no choice but to bring the service physically closer to the end users by replicating it in major geographical locations.
- **Maintenance** — you can upgrade individual nodes without taking the system down.

The main cost to having all these advantages is *complexity*. It's harder to design, develop, monitor, debug, etc.

There is also the drawback of potentially higher latency because of the overhead in nodes sending each other network requests.

# Theory
- [[Knowledge/Engineering/Distributed Systems/CAP Theorem|CAP theorem]]
- [[Knowledge/Engineering/Distributed Systems/Distributed Consensus|Distributed Consensus]]

