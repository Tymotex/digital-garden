---
title: find
---

`find` is useful for when you're after a file you don't know the path to in a directory tree. 
```sh
# Basically like `tree $PATH`, minus the formatting.
find $PATH

# Find all .nginx files from the current dir. 
find . -name '*.nginx'     # Similar to `find . | grep '*.nginx'`

# Run a command for each result that turns up.
find . -name '*.cc' -exec rm {} +              # The {} is a placeholder that the path is interpolated into.
                                               # The + is like a terminator.
	# Equivalent to:
	find . -name '*.cc' | while read f; do
		rm "$f"
	done
```
