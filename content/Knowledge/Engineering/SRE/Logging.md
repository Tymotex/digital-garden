---
title: Logging
---

## Why not just Print?
- Logging captures many other details like timestamp.
- Printed output is often lost because it's not written to persistent storage.
- Logging levels let you filter through the noise to find the problem.

## Log Severity Levels
- Debug — for engineers to print debug logs.
- Info — for confirming things are working as expected.
- Warning — something unexpected or undesirable has happened but the program can continue running
- Error — program has reached an error and failed some operation entirely.
- Critical — program has probably reached some fatal error.
