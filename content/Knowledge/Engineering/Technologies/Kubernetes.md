---
title: Kubernetes
description: Kubernetes
---

![[Knowledge/Engineering/Technologies/assets/kubernetes-wallpaper.png|700]]

Kubernetes is an open-source *container orchestrator*, ie. a system for automating the deployment and [[Knowledge/Engineering/Cloud/Scaling|scaling]] of [[Knowledge/Engineering/DevOps/Containers|containers]]. The rise in popularity of microservice architectures gave rise to the need for container orchestration tools because microservices often need to be containerised. Container orchestrators like Kubernetes are meant to solve challenges arising from scaling [[Knowledge/Engineering/DevOps/Containers|containers]]. Some other technologies similar or related to Kubernetes include [OpenShift](https://docs.openshift.com/), [Amazon ECS](https://aws.amazon.com/ecs/), [Rancher](https://rancher.com/), [Apache Mesos](http://mesos.apache.org/) and more.

*Note*: Kubernetes and [[Knowledge/Engineering/Technologies/Docker|Docker]] are completely independent technologies. You can use Docker without Kubernetes. Kubernetes, however, needs a container runtime to orchestrate, which may or may not be Docker. It's just common for Docker and Kubernetes to be used together.

**Some background:** 'Kubernetes' originates from Greek, meaning 'helmsman', the person who steers a ship. K8s is an abbreviation for Kubernetes. The '8' is just a count of the letters between k and s.

**Kubernetes Features:**
- Automated *rollout* and *rollback* — updates are deployed automatically with care and when things go wrong, the system is rolled back to a stable state.
- *Failover* — when one container dies, another container is able to take its place, automatically.
- *Horizontal scaling* — when the load is high, then K8s will automate the creation of new containers to meet demand, and when the load is low, then containers are removed
- *Load balancing* by distributing work across a set of *pods*.

## K8s Cluster Architecture
![[Knowledge/Engineering/Technologies/assets/kubernetes-architecture.png|800]]
### Nodes, Control Planes
Kubernetes clusters consist of 2 types of resources: *nodes* and *control planes*.
1. **Node** — also called *worker nodes*. They're the [[Knowledge/Engineering/DevOps/Virtual Machines|VMs]] running the app's containers. Each node has a **Kubelet** running inside them.
    - **Kubelet** — a process running inside a node that makes it possible to talk for the node to talk to the *control plane*. They're responsible for telling the control plane about the health of the worker node.
2. **Control plane** — also called the *master node*. It's responsible for managing all activities in the cluster like scheduling, scaling, rolling out updates, etc. 

	A bunch of critical Kubernetes processes run within the control plane, one of which is an HTTP [Kubernetes API](https://kubernetes.io/docs/concepts/overview/kubernetes-api/) server which the nodes use to communicate with the control plane. It's basically the entrypoint to the K8s cluster and Kubernetes clients talk to this server (eg. through a Kubernetes dashboard, scripts, CLIs, etc.)

### Kubernetes Components
- **Pods** — a logical grouping of one or multiple containers with shared storage and network. They're the *smallest deployable units* of computing that you can create and manage inside a worker node, which can run multiple pods within.
	- It's common practice to run 1 container per pod.
	- Each pod gets its own virtual internal IP address.
	- Pods are ephemeral. When they die, another takes its place.
	![[Knowledge/Engineering/Technologies/assets/Pasted image 20220805091942.png|400]]
- **API server** — the entrypoint to the K8s cluster. It serves the [Kubernetes HTTP API](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)
- **Controller Manager** — tracks activities in cluster
- **Scheduler** — ensures intelligent *pod* placement based on workload and available resources
- **etcd** — key-value store for config and backups
- **ConfigMap** — contains config like database URLs that the pod can use. Makes it so that you just have to change stuff at the configmap level rather than at the application code level. It's not secure enough for confidential info though
- **Secret** — like ConfigMap, but for secret credentials
- **Volumes** — for data persistence. Think of it as an external hard drive plugged into the cluster
	![[Knowledge/Engineering/Technologies/assets/kubernetes-node-volume.png|300]]

## Service Discovery
TODO.

Every *pod* gets assigned an internal IP address like `192.*.*.*`.

You can group the replicas of a service and put them behind a [[Knowledge/Engineering/Architecture/Load Balancer|load balancer]], for example, to expose a single cluster IP address that all other services use to talk to it.

There's even a DNS service that maps symbolic names to those IP addresses.

## Kubectl
TODO.

This is the Kubernetes CLI.

You can
- `kubectl exec -it <pod> -- /bin/bash` to launch a shell in a pod. Useful for debugging.

## Under the hood
TODO.
