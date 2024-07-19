---
title: dmesg
---

Display the kernel messages stored in the kernel ring buffer, generated during system boot and while the system is running.

E.g. Running `sudo dmesg --follow` and then unplugging and re-plugging my MX Master 3 mouse's wireless receiver shows these logs:
```
[ 1612.661465] usb 1-3: USB disconnect, device number 2
[ 1616.456874] usb 1-3: new full-speed USB device number 9 using xhci_hcd
[ 1616.778389] usb 1-3: New USB device found, idVendor=046d, idProduct=c548, bcdDevice= 5.01
[ 1616.778395] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 1616.778397] usb 1-3: Product: USB Receiver
[ 1616.778399] usb 1-3: Manufacturer: Logitech
[ 1616.811543] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:01.2/0000:01:00.0/usb1/1-3/1-3:1.0/0003:046D:C548.000B/input/input20
[ 1616.867060] hid-generic 0003:046D:C548.000B: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-3/input0
[ 1616.874590] input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:01.2/0000:01:00.0/usb1/1-3/1-3:1.1/0003:046D:C548.000C/input/input21
[ 1616.875000] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:01.2/0000:01:00.0/usb1/1-3/1-3:1.1/0003:046D:C548.000C/input/input22
[ 1616.930256] input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:01.2/0000:01:00.0/usb1/1-3/1-3:1.1/0003:046D:C548.000C/input/input23
[ 1616.930334] hid-generic 0003:046D:C548.000C: input,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-3/input1
[ 1616.935471] hid-generic 0003:046D:C548.000D: hiddev96,hidraw2: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:01:00.0-3/input2
```
