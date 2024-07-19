---
title: Less
---

Piping to `less` will open a pager with vim-like controls.
```sh
# Setting some nice default flags.
# 1. Show line numbers.
# 2. Dump to terminal after exiting pager.
# 3. Don't show pager if the output fits in the window.
# 4. Watch the file for changes.
# 5. Show file location indicator.
export LESS="-N -X -F --follow-name -M"
```
