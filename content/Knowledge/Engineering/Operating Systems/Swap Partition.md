---
title: Swap Partition
---

*Swap partitions* are a type of [[Knowledge/Engineering/Operating Systems/Disk Partition|disk partition]] that isn't formatted with a filesystem because it serves different purposes:
- When your RAM is at full utilisation, additional things that would normally go into RAM get written to the swap partition.
- When you make your machine hibernate, the contents of RAM get transferred to the swap partition.
	- Without a swap partition, hibernation is impossible.

Swap partitions are optional. You can have a working system without one.
