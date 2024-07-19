---
title: Database Index
---

A **database index** is a supplementary data structure that lets you quickly look up specific rows in a table. An index is always associated with a column of a table.
- They're for optimising specific reads and other database operations.
- They usually contain a subset of the table being indexed.
- The person/application consuming the database by issuing SQL queries doesn't know about the existence of database indexes. It's managed purely by the database admin or programmer.
- A single table can have multiple indexes defined on it.

Supposing you issued a `SELECT * FROM Table WHERE FirstName = "Linus"` query, without an index it would require a linear scan to get the result. To speed up these queries, you could 'create an index on the `FirstName` column', where you maintain a separate table containing the `FirstName` column that's sorted alphabetically. With this index, you can determine which row to find `FirstName = "Linus"` using binary search, then look it up in the original table.

The tradeoff is that you get faster queries at the cost of using increased storage space and worsened performance for mutation (`INSERT`, `UPDATE`, `DELETE`) operations because you'd also have to modify the index to keep it up to date.

You define database indexes using `CREATE INDEX` in [[Knowledge/Engineering/Languages/SQL|SQL]], e.g.
```sql
CREATE INDEX name_index ON Users (FirstName);
```
Once defined, the database engine will make sure to attempt an index lookup any time there's a query on `FirstName`.

In addition to faster lookups, an index on a column `FirstName` makes it faster to sort the original table by `FirstName`, grouping by `FirstName`, and joining tables.

**How it improves join performance.** Joining tables is about matching the rows of two tables together based on a shared column's value. If the two tables define an index on that shared column, then it's faster to locate the rows that should be joined. If only one table defines an index on the shared column, it'll still be faster than if you had no indexes at all.

## Composite Index
You can create database indexes on multiple columns. For example, this index would make it faster to resolve queries like `SELECT * FROM Users WHERE FirstName = "Linus" AND LastName = "Torvalds"`.
```sql
CREATE INDEX name_index ON Users (FirstName, LastName);
```

