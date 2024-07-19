---
title: modinfo
---

`modinfo` displays info about a kernel module. You can use [[Knowledge/Engineering/UNIX/lsmod|lsmod]] to list all the modules, then use `modinfo` to inspect details about a module.

E.g. Output of `modinfo nvidia` for me.
```
filename:       /lib/modules/6.6.18-1-lts/updates/dkms/nvidia.ko.zst
alias:          char-major-195-*
version:        545.29.06
supported:      external
license:        NVIDIA
firmware:       nvidia/545.29.06/gsp_tu10x.bin
firmware:       nvidia/545.29.06/gsp_ga10x.bin
...
```
