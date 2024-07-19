---
title: Boot Process
---

The following is a high-level overview of how a machine boots from the moment you turn on the power to the login screen being presented to you.
1. [[BIOS]] is the first thing to run. It:
	- Launches the [[Knowledge/Engineering/Operating Systems/POST Test|POST test]].
	- Initialises the CPU, RAM, storage devices, peripherals.
2. BIOS pulls some config data from the [[Knowledge/Engineering/Operating Systems/CMOS|CMOS]]. The boot order is part of that config, which determines what device to boot. This is often your hard drive, but could also be a USB or other media.
3. Depending on whether your partitioning scheme is [[MBR]] or [[GPT]], BIOS will transfer execution to the boot loader code stored on disk.
4. The boot loader puts the operating system's kernel code into memory. The boot loader transfer execution to the kernel.
	- If multiple operating systems are installed in separate [[Knowledge/Engineering/Operating Systems/Disk Partition|disk partitions]], the boot loader presents a menu letting the user pick which one to boot into.
5. The kernel runs initialisation steps:
	- Mounting the root filesystem.
	- Starts [[Knowledge/Engineering/Operating Systems/User Space and Kernel Space|user space]] processes.
	- Starts the login greeter.
	- ... and so on.

![[Knowledge/Engineering/Operating Systems/assets/boot-process-sequence-diagram.png|600]]
([source](https://en.wikipedia.org/wiki/Booting))
