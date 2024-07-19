---
title: SQL
description: SQL
---


TODO.

## Joins


### Join Algorithms
Join algorithms are the algorithms used to join two tables' rows on a shared column to produce a resultant table.

There are several join algorithms, but this is a simple join algorithm called the nested loop join:
```python
result_table = {}
for outer_row in outer_table:
    for inner_row in inner_table:
        if same_join_col_val(inner_row, outer_row):
            combined_row = inner_row + outer_row
            result_table.upsert(combined_row)
```
