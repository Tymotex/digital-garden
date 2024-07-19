---
title: Systemctl
---

The utility `systemctl` is used to control the services (daemons) running on the machine.

## Usage
```sh
sudo systemctl start   <service_name>
sudo systemctl status  <service_name>
sudo systemctl stop    <service_name>
sudo systemctl enable  <service_name>
sudo systemctl disable <service_name>

systemctl list-unit-files    # Lists all services, enabled or not.
```

To make your own services manageable with `systemctl`:
1. Write a [service configuration file](https://www.freedesktop.org/software/systemd/man/systemd.service.html).
2. Put `*.service` files inside `/etc/systemd/system` and then they become available for you to start, stop, enable, disable, etc.
