---
title: Site Reliability Engineering
---

**Questions**:
- How is Colossus run? Is some slave instance running on all machines?
- Colossus is said to be a cluster-wide filesystem. In data centres, a cluster is a group of racks. Does a single instance of Colossus manage exactly 1 of these physical clusters?
- What exactly *are jobs* in Borg? Are they like containerised binaries?
- Apart from RPCs providing better abstraction, why would you pick it over something like HTTP requests when you want communication between services?
- What is Chef and Puppet?

---

![[Knowledge/Engineering/SRE/assets/data-centre-wallpaper.png|700]]

SREs are software engineers whose focus is to create *reliable*, scalable software systems. *Reliability* formally means: "the probability that [a system] will perform a required function without failure under stated conditions for a stated period of time." 

Reliability is a function of:
- *Mean time to repair (MTTR)*: time taken to restore system health.
- *Mean time to failure (MTTF)*: time taken for system to fail.

The focuses of creating reliable systems are:
- Availability — usually reported as the percentage of time the service is able to respond.
- Latency — how long it takes for a request to get a response.
- Performance
- Efficiency — in the utilisation rate of resources (using fewer computing resources).
- Change management — since changes to live systems often account for around 70% of outages, we need strategies like progressive rollouts and rollbacks.
- Monitoring — so we know whether we're meeting [[Knowledge/Engineering/SRE/SLIs, SLOs, SLAs|SLOs]].
- Emergency response
- Capacity planning

Google loosely enforces a 50/50 split between development and operations work for SREs. Coding skills are still critical.

> "Reliability is the most fundamental feature of any product" — Ben Treynor Sloss.

> "SRE is what happens when you ask a software engineer to design an operations team." — Ben Treynor Sloss.

> "Software Engineering has this in common with having children: the labour before the birth is painful and difficult, but the labour after the birth is where you actually spend most of your effort."

Costs of running software after reaching production typically constitute 40-90%, meaning it's almost never the case that deployed software requires less attention from software engineers.

In the traditional development/operations split, the operations team size would scale linearly with service size. A primary focus of SRE is automating away the needs for a growing operations team and removing humans from the loop as much as possible. The SRE team size scales sublinearly with service size.

> "One could equivalently view SRE as a specific implementation of DevOps with some idiosyncratic extensions."

# Fundamentals
- [[Knowledge/Engineering/SRE/Google Infrastructure|Google Infrastructure]]
- [[Knowledge/Engineering/SRE/Error Budget|Error budget]]
- [[Knowledge/Engineering/SRE/SLIs, SLOs, SLAs|SLIs, SLOs and SLAs]]
- [[Knowledge/Engineering/SRE/Toil|Toil]]
- [[Knowledge/Engineering/SRE/Troubleshooting|Troubleshooting]] TODO
- [[Knowledge/Engineering/Distributed Systems/Distributed Consensus|Distributed Consensus]]
- [[Knowledge/Engineering/SRE/Monitoring|Monitoring]] TODO
- [[Knowledge/Engineering/SRE/Canary|Canary]] TODO

# Flashcards
- What are the 5 technologies constituting Google's storage stack?
    - They're D, Colossus, Bigtable, Spanner and Blobstore. D sits at the lowest level as a fileserver on almost every machine in a datacentre. Colossus wraps around D to create a distributed cluster filesystem and is a dependency of Bigtable (NoSQL database service) and Spanner (SQL database service).
- What is Borg?
    - A distributed 'cluster operating system' which acts as a job scheduler. You give it jobs and say they need a certain number of CPU cores and RAM, and Borg will handle the rest — picking which machines to run the job's tasks and restarting the job's tasks when it fails, etc.

