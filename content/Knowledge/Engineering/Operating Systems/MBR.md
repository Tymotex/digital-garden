---
title: MBR
---

The **MBR** (*Master Boot Record*) is a type of *partitioning scheme*, like [[Knowledge/Engineering/Operating Systems/GPT|GPT]]. Partitioning schemes are protocols for how to create [[Knowledge/Engineering/Operating Systems/Disk Partition|disk partitions]]

Basically, in a bit of dedicated space at the start of a storage drive we store the [[Knowledge/Engineering/Operating Systems/Boot Loader|boot loader]] code (e.g. [[Knowledge/Engineering/Operating Systems/GRUB|GRUB]]) and a *partition table*, which is a data structure tracking where all the [[Knowledge/Engineering/Operating Systems/Disk Partition|disk partitions]] are.

**What is MBR's role in the boot process?** See [[Knowledge/Engineering/Operating Systems/Boot Process|Boot Process]]. Basically, BIOS does its thing, then transfers execution to the boot loader code.

In the context of installing operating systems, you should know these details:
- MBR supports a maximum of 4 primary partitions.
- Each partition is limited in size to 2TB.

Interesting note: there exists extremely destructive malware that can wipe the MBR’s contents, making a system basically irrecoverable. It’s been used by Russia against Ukraine in 2022.
