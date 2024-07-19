---
title: GPT
---

Just like [[MBR]], **GPT** (*GUID (Globally Unique Identifier) Partition Table*) is a specification for storing the boot loader and the disk partition table. GPT is slowly replacing MBR because it supports greater storage capacities (MBR only supports partitions of up to 2TB) and does a better job of preventing data loss and corruption since it replicates your data across your disk.

See [[Knowledge/Engineering/Operating Systems/MBR|MBR]] for more details about partitioning schemes and see [[Knowledge/Engineering/Operating Systems/Boot Process|Boot Process]] for how GPT fits in to getting an operating system booted.
