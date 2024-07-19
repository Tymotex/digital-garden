---
title: Borg
---

Borg is a distributed 'cluster operating system', or more precisely — a job scheduler for a cluster of machines, that handles computing resource allocation. If you want to run something, you tell Borg how many CPU cores and RAM you need, and it handles finding the machines in the cluster its overseeing to run it on. Borg also handles restarting things when they fail.

![[Knowledge/Engineering/SRE/assets/borg-architecture.png|500]]

Borg runs *jobs* (which are basically just binaries), which are indefinitely running services or one-off things like a MapReduce. *Jobs* consist of 1 or more identical *tasks*.

Borg is a predecessor to [[Knowledge/Engineering/Technologies/Kubernetes|Kubernetes]].

> "Borg is what Google uses for an OS on a cluster. It's a way of taking some thousands of machines and making them sort of look like one." — Andrew McGregor

> "Borg was born: a system that moved away from the relatively static host/port/job assignments of the previous world, toward **treating a collection of machines as a managed sea of resources**." — Google SRE book.

## BNS
**BNS** (Borg Naming Service) is a level of indirection necessary for Borg to identify tasks (similar to DNS and IP addresses). It maps a unique string like `/bns/<cluster>/<user>/<job_name>/<task_number>` to an `<IP address>:<port>`.
