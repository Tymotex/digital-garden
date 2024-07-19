---
title: C
description: C
---


### Spiral Rule
See [the Clockwise/Spiral Rule](https://c-faq.com/decl/spiral.anderson.html).
TODO.

## Preprocessor Directives
### Include Directive
`#include` tells the preprocessor to copy the contents of the included file and directly paste it into the current file, that’s literally all that happens.
- `#include <path>`
    - With `<>`, the preprocessor searches for the thing to include in directories defined by the compiler. You would use <> often for including standard library headers
    - On Linux, you can find all the libraries stored on the path `/usr/include/c++/<version_num>`
- `#include "path"`
    - With `“”`, the preprocessor searches first in the same directory as the file first, and then searches through the same directories that `#include <path>` would search through

### Header Guards
Header guards are used inside header files to ensure that the contents of the file are not copied and pasted more than once to any single file. They have the form:
```cpp
#ifndef YOUR_HEADER_NAME_H
#define YOUR_HEADER_NAME_H

...

#endif
```
