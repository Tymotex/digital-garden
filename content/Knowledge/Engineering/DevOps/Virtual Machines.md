---
title: Virtual Machines
description: Virtual Machines
---

## System Virtual Machine

> "A 'virtual machine' was originally defined by Popek and Goldberg as 'an efficient, isolated duplicate of a real computer machine.''"

A *virtual machine* (VM) is a computer system that is created by software. It is meant to function indistinguishably from an actual discrete physical computer system would, meaning that a virtual machine has its own concept of what CPU it has, memory capacity, network interface, storage and so on.
- A single physical computer can run multiple VMs.
- Virtual machines are created and managed by [[Knowledge/Engineering/DevOps/Hypervisor|hypervisors]].
- VMs are literally *just files*, called *images*, stored on the host machine.

Where virtual machines are used:
- They make up a huge part of [[Knowledge/Engineering/Cloud/Cloud Computing|the cloud]].
- Running [[Knowledge/Engineering/DevOps/CI|CI]] tasks, production web servers, and many cloud services.
- When you need a Linux environment for your personal work computer, which unfortunately is using Windows 🤢. You might need this to run apps that you otherwise couldn’t.
- Malware testing and reverse engineering. You can take advantage of the isolation of the VM to execute malware and observe how it works. This is not foolproof, some sophisticated malware can detect that it’s in a VM!

### VM Architecture
A single physical computer can run multiple VMs. This is how its set up in the servers that make up the cloud:

![[Knowledge/Engineering/DevOps/assets/hosted-virtual-machine-architecture.png|400]]

## Process Virtual Machine
In most contexts, the usage of the term 'virtual machines' actually refers to the *system virtual machines* described above. Otherwise, it describes *process virtual machines* which is quite different.

A *process virtual machine* is the software that is used to provide a platform-independent environment to execute a program.

The *JVM, Java Virtual Machine*, is an example of a process virtual machine. It is just a regular process on the computer, and its job is simply to execute Java bytecode.
