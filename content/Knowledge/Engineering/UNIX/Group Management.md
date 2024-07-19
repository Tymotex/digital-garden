---
title: Group Management
---


All files in Linux are owned by either a user *and* a group. You can see which user and group own a file using `ls -l`.
```sh
$ ls -l
-rw-r--r--  1 tym tym 2464 Jun  2 08:05 README.md
               ^   ^
             User Group
```

Groups are very useful for access control. Giving a group ownership over a file makes all its members owners of that file.

Just as you have `/etc/passwd` for [[Knowledge/Engineering/UNIX/User Management|user management]], you have `/etc/group` for group management. Similar to how new human users get UIDs from 1000 onwards, human groups get group IDS (GID) from 1000 onwards too. GIDs lower than 1000 are usually intended for system users as opposed to human users.
```sh
$ cat /etc/group | grep "docker"
docker:x:966:tym
              ^
	members in the group
```

Commands to know about:
- `groups` — what groups you're a member of.
	- `groups $USERNAME` for groups a specific user is in.
- `groupadd`
	- Analogous to `useradd` in [[Knowledge/Engineering/UNIX/User Management|user management]].
- `groupdel`
	- Analogous to `userdell` [[Knowledge/Engineering/UNIX/User Management|user management]].
- `usermod --append --groups $GROUP` — add user to a group.
