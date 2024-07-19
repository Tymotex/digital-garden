---
title: Disk Partition
---

Disks may have their capacity divided into a few slices. A *disk partition* is a slice of the disk’s capacity.
- Partitions are independent of each other and can be managed entirely separately, meaning that in one physical hard drive you can have 1 partition containing Linux and another partition containing Windows. 
- Each partition is formatted with its own [[Knowledge/Engineering/Operating Systems/File System|file system]].

*Disk partitioning* is the act of creating disk partitions.
- On Windows you'd use the *Disk Management* program. On Linux you'd use a utility like GParted, or a CLI like `fdisk`.

![[Knowledge/Engineering/Operating Systems/assets/disk-partition-diagram.png|500]]

For Linux, it's common to have:
- One partition holding system files mounted on `/`.
- One for user data on /home.
- One swap partition.
