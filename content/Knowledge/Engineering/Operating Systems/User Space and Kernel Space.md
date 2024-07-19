---
title: User Space & Kernel Space
description: User Space & Kernel Space
---

Most operating systems will divide the computer's [[Knowledge/Engineering/Operating Systems/Virtual Memory|virtual memory]] into two parts: the *user space* (or *userland*) and the *kernel space*. The kernel space is a partition of virtual memory whose contents are protected from direct access by non-operating system software like your regular scripts, apps and daemons. Only the kernel, device drivers and other critical OS software can freely read/write to the kernel space. Everything else can read/write only to user space.

![[Knowledge/Engineering/Operating Systems/assets/userland-and-kernel-space.png|400]]

The main motivation for this is to prevent malicious or unintentionally destructive programs from wrecking havoc on the computer system by manipulating critical operating system data.

