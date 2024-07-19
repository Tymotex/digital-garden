---
title: User Management
---

When you `cat /etc/passwd`, each line represents a distinct user on the system.

Every user has a user ID (UID). Usually when you create a new user with `useradd` it gets assigned 1000, then the next will be 1001, and so on. UIDs below 1000 are usually reserved for system accounts that usually aren't to be used by humans.
```
$ cat /etc/passwd | grep "tym"
tym:x:1000:1000::/home/tym:/bin/zsh
       ^
      UID
```

`/etc/passwd` doesn't store the actual passwords of users, that is instead stored in `/etc/shadow` as a hashed and salted string.

Commands to know about:
- `useradd $USERNAME`
- `userdel $USERNAME`
- `passwd`
	- Alone, this changes the password for the current user. To change a specific user's password: `sudo passwd $USERNAME`.
