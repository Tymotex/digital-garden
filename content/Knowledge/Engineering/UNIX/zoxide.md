---
title: zoxide
---

You need to use `z` instead of `cd` normally for a while at first to train up zoxide to then make more powerful navigation possible.

As you navigate around with `z`, zoxide will analyse your activity and assign weights to certain directory paths. The weighting is a function of frequency (number of visits) and recency (when last visited).

Once a path becomes frequently accessed enough, you can navigate to it using path fragments.

E.g. `z projects foo` can navigate you to `~/Projects/blah/foo` if that path has the highest weighting out of all candidate paths that `"projects foo"` may match to.
- The matching rules are:
	- `projects` must appear before `foo` in the path.
	- `foo` must be the last directory in the path.


- `z -` — return to the previous directory.

## Fzf Integration
Also see [[Knowledge/Engineering/UNIX/fzf|fzf]], an independent tool that Zoxide has great integration with. When you have fzf, you can run `zi` to then view a list of the highest weighting paths and fuzzy finding the right destination.
