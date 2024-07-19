---
title: rsync
---

`rsync` is basically like `cp`, but it can seamlessly copy files/directories between local and remote machines. It's called `rsync` because it can keep filesystems in a remote machine in sync with the local one.

Here's the basic usage. Just like `cp`, the source comes before the destination:
```sh
# Copying `/foo/bar` on this machine over to `/baz/qux` on a remote machine.
rsync -avz /foo/bar username@address:/baz/qux
```
- The `username@address` is the same thing you'd use to ssh into that machine. E.g. `ssh root@149.12.173.1`.
- `-avz` uses the archive, verbose and compress (zipped) flags. This means the copy preserves file attributes like permissions, shows detailed info about the transfer, and compresses files for faster network transfer.
