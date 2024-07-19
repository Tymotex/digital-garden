---
title: lsmod
---

Lists the currently loaded *kernel modules*, which are bits of code (for drivers usually) dynamically loaded into the Linux kernel at runtime. 

E.g. `lsmod | grep "nvidia"` should show you the Nvidia drivers installed on your Linux system.
```
nvidia_drm            118784  8
nvidia_uvm           3506176  0
nvidia_modeset       1585152  11 nvidia_drm
video                  77824  2 asus_wmi,nvidia_modeset
nvidia              62390272  197 nvidia_uvm,nvidia_modeset
```

Use [[Knowledge/Engineering/UNIX/modinfo|modinfo]] to show greater detail about a kernel module.
