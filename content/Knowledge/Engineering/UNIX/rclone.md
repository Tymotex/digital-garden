---
title: rclone
---

Rclone is a tool that lets you manipulate files stored in various Cloud storage services like Google Drive, Dropbox, etc. In particular, it lets you mount those services on your filesystem, so you can access them like local files. It's an essential part of my [[Knowledge/Engineering/Operating Systems/Personal Arch Linux Setup|Personal Arch Linux Setup]].

## Using rclone
tl;dr, you create 'remotes' which each have their own config and data source. You can then mount a remote on your local filesystem to access files in that data source.
```sh
# Takes you through an interactive creation for a new 'remote'
rclone config

# Show all remotes.
rclone listremotes

# Mounting a storage service's file tree onto local filesystem.
# E.g. rclone mount MyGoogleDrive:/Docs/ ~/Documents/MyDocs
rclone mount $REMOTE_NAME:$REMOTE_PATH $LOCAL_PATH_MOUNT_POINT

# Copying files.
rclone copy $REMOTE_NAME:$REMOTE_PATH $LOCAL_PATH
```
