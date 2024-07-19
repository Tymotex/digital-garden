---
title: journalctl
---

`journalctl` queries and dumps logs from the *systemd journal*. This is where logs from daemons, apps, the kernel, etc. get stored.
- The systemd journal is stored at `/var/log/journal`.

By default it shows the earliest logs first, then the latest logs at the bottom.

Here are some useful journalctl commands:
- `journalctl -p err` shows error logs.
- `journalctl --follow` shows the most recent logs, real-time.
