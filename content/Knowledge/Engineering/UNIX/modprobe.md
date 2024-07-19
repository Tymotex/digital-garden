---
title: modprobe
---

`modprobe` lets you dynamically load and remove kernel modules while the Linux kernel is running.
- `sudo modprobe $MODULE_NAME` loads a module.
- `sudo modprobe $MODULE_NAME` removes a module.

The `/etc/modprobe.d/` directory contains some config files that change `modprobe`'s behaviour as it loads certain modules.

E.g. I have a NVIDIA GPU and I do not want to use the open-source `nouveau` driver. I have the following file, `/etc/modprobe.d/blacklist.conf` that prevents nouveau from being loaded into the Linux kernel on boot.
```
blacklist nouveau
options nouveau modeset=0
```
