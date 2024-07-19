---
title: Raspberry Pi
---

![[Knowledge/Engineering/Embedded Systems/assets/raspberry-pi.jpg|600]]

## Networking

### Hostname
The hostname is a human-readable alias for a device on a network. The hostname identifies your Raspberry pi in your home network.
- The hostname is stored in `/etc/hostname`.

To change the hostname:
- Edit `/etc/hostname`.
- Edit `/etc/hosts` to change `127.0.0.1  old-hostname` to `127.0.0.1  new-hostname`.

### DHCP Reservation
Your home router probably runs a [[Knowledge/Engineering/Networking/DHCP|DHCP]] server which reassigns local IP addresses to your devices.
If you're using the Raspberry pi as a server, then you'd probably like to have a stable IP address.

