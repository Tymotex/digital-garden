---
title: Hypervisor
description: Hypervisor
---

A *hypervisor*, in most contexts, is the *software* that creates and runs [[Knowledge/Engineering/DevOps/Virtual Machines|virtual machines]]. [VMWare](https://www.vmware.com/au.html) is an example of a hypervisor that you might use for running a different OS on a personal work computer (eg. running Ubuntu on a computer whose main OS is Windows 11). AWS has its own [Nitro](https://aws.amazon.com/ec2/nitro/) hypervisor that is being used to create EC2 instances. 

In [[Knowledge/Engineering/Operating Systems/Kernel|kernels]], the position of highest privilege is called the supervisor. The prefix 'hyper-' is a stronger variant of the prefix 'super-', so the hypervisor is named such because it is basically the *supervisor of supervisors*.

The computer that runs a hypervisor is called a *host machine* while the virtual machines within are call *guest machines*. Hypervisors handle resource allocation to guests VMs, eg. it handles CPU scheduling among other things.

![[Knowledge/Engineering/DevOps/assets/hypervisor.png|500]]
