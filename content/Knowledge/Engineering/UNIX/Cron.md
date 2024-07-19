---
title: Cron
---

**Cron** is a UNIX utility that lets you run commands in the background at specific times. It's name is short for 'chronos', the Greek word for 'time'.

Cron jobs are created by using the `crontab -e` command which opens a crontab file where you can write your command and the time it should run. 'Crontab' is short for 'cron tables'. A Cron daemon starts when you boot into your machine and looks for crontab files for commands to run.

This runs at 2:00am every day.
```sh
0 2 * * * /home/tim/scripts/hello.sh
```

Crontab entries follow the format:
```sh
*    *    *    *    *    command to execute
-    -    -    -    -
|    |    |    |    |
|    |    |    |    +----- day of week (0 - 6) (Sunday=0)
|    |    |    +------- month (1 - 12)
|    |    +--------- day of month (1 - 31)
|    +----------- hour (0 - 23)
+------------- min (0 - 59)
```

## Using Cron
Cron should already be running on your system. Verify this with `systemctl status cron`.

Use `crontab -e` to add a new cron job, then `crontab -l` to confirm it has been added. That's it - it'll just start running at the specified time.
