---
title: ps
---

```sh
# By itself, `ps` only shows the processes associated with the current terminal session.
ps

# 'ps aux' is a very typical command to use. It shows all:
#   A - all processes (not just those scoped to this terminal session)
#   U - user info for each process (CPU, memory, the user that kicked off the process, etc.)
#   X - daemon processes that aren't connected to a terminal.
ps -aux
```

Also, for maximal detail, try using `ps -axjf` which additionally shows the parent-child branching of processes. E.g. The output below shows how my display manager, `ly`, spun up my window manager, `i3`, which then spun up everything else on my desktop environment.
```
$ ps -axjf
   PPID     PID    PGID     SID TTY        TPGID STAT   UID   TIME COMMAND
	...
    733     951     733     733 tty2         733 S+    1000   0:00  \_ /usr/bin/ly-dm
    951     986     733     733 tty2         733 Sl+   1000   7:17      \_ /usr/lib/Xorg :0 vt2
    951    1169     733     733 tty2         733 Sl+   1000   0:00      \_ i3
   1169    1204    1204    1204 ?             -1 Ss    1000   0:00          \_ /bin/sh -c greenclip daemon>/dev/null
   1204    1209    1204    1204 ?             -1 S     1000   0:09          |   \_ greenclip daemon
   1169    1208    1208    1208 ?             -1 Ss    1000   0:00          \_ bash /home/tym/.config/polybar/launch.sh
   1208    1219    1208    1208 ?             -1 Sl    1000   0:03          |   \_ polybar
   1219    1581    1581    1208 ?             -1 S     1000   0:00          |       \_ bash /sbin/pulseaudio-control --icons-volume  ,  --icon-muted   --node-nicknames-from device.description listen
   1581    1648    1581    1208 ?             -1 S     1000   0:00          |       |   \_ pactl subscribe
   1581    1649    1581    1208 ?             -1 S     1000   0:00          |       |   \_ grep --line-buffered -e on \(card\|sink\|server\)
   1581    1650    1581    1208 ?             -1 S     1000   0:00          |       |   \_ bash /sbin/pulseaudio-control --icons-volume  ,  --icon-muted   --node-nicknames-from device.description listen
   1219    1583    1583    1208 ?             -1 S     1000   0:00          |       \_ bash /sbin/pulseaudio-control --node-type input --icons-volume  --icon-muted  --node-nicknames-from device.description listen
   1583    1651    1583    1208 ?             -1 S     1000   0:00          |           \_ pactl subscribe
   1583    1652    1583    1208 ?             -1 S     1000   0:00          |           \_ grep --line-buffered -e on \(card\|source\|server\)
   1583    1653    1583    1208 ?             -1 S     1000   0:00          |           \_ bash /sbin/pulseaudio-control --node-type input --icons-volume  --icon-muted  --node-nicknames-from device.description listen
   ...
```
