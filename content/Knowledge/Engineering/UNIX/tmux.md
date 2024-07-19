---
title: tmux
---

## Tmux CLI
```sh
tmux a -t $SESSION             # Start and attach to a new session.
tmux ls                        # Show sessions.
tmux kill-session -t $SESSION  # Kill session.
```

## Tmux Shortcuts
```
ctrl+b, d
ctrl+b, $       # Rename
ctrl+b, %       # Get a new terminal pane to the right of this one.
ctrl+b, "       # Get a new terminal pane below this one.
ctrl+b, arrow   # Focus on the pane in that direction.
ctrl+b+arrow    # Resize current panel in that direction.
```

## Tmux Configuration
Scrolling with your mouse in TMux doesn’t work by default. You have to first enter scrolling mode for it to work: `ctrl+b, [`. To get out of scroll mode, hit `q`.

Add this `.tmux.conf` to your `$HOME` directory to get Vim-like keybindings. To apply the changes without restarting tmux, just run `tmux source-file .tmux.conf`.
```sh
# vim-like pane resizing  
bind -r C-k resize-pane -U
bind -r C-j resize-pane -D
bind -r C-h resize-pane -L
bind -r C-l resize-pane -R

# vim-like pane switching
bind -r k select-pane -U 
bind -r j select-pane -D 
bind -r h select-pane -L 
bind -r l select-pane -R 

# and now unbind keys
unbind Up     
unbind Down   
unbind Left   
unbind Right  

unbind C-Up   
unbind C-Down 
unbind C-Left 
unbind C-Right
```
