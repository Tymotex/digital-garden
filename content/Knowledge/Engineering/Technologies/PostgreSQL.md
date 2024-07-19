---
title: PostgreSQL
description: PostgreSQL
---

![[Knowledge/Engineering/Technologies/assets/postgresql-wallpaper.png|750]]

PostgreSQL is an *object-relational* DBMS that is [[Knowledge/Engineering/Languages/SQL|SQL]]-compliant. Postgres being an 'object-relational' DBMS means that it supports table inheritance and function overloading, inspired by [[Knowledge/Engineering/Programming/Object Oriented Programming|OOP]]. It's an open-source successor to the proprietary [Ingres DBMS](https://en.wikipedia.org/wiki/Ingres_(database)), hence the name '*Post*gres'.

## PSQL CLI
Launching `psql` and connecting to a local or remote database server:
```bash
psql -h localhost -p 5432 -U <user> -d <db_name>

# Or you can use the probably friendlier standard database connection URI string:
psql "postgresql://<user>:<password>@<host+port>/<db_name>"

# For example, connecting to the 'techsuite' database at localhost:5432 with the
# username 'tim' whose password is '1989'.
psql "postgresql://tim:1989@localhost:5432/techsuite"
```
