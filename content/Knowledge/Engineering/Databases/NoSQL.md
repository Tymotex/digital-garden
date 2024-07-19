---
title: NoSQL
description: NoSQL
---

> In this set of notes, we only consider *document-oriented* databases such as MongoDB and [[Knowledge/Engineering/Technologies/Firebase|Firebase]]. There are also other types of NoSQL databases such as graph databases (like [Neo4j](https://neo4j.com/)) and simple key-value stores like [Redis](https://redis.io/) or [Memcached](https://memcached.org/).

*NoSQL* ("**n**ot **o**nly SQL") databases are those that ditch the idea of defining data using relational theory involving tables, rows and columns and linking them together.

**Why NoSQL over relational databases?**
The main two reasons are *flexibility* and *easier scaling*:
1. NoSQL uses flexible data models that are easier to modify in response to changes in business requirements or the query patterns of the users compared to relational databases.
2. Database servers are easier to scale horizontally through [[Knowledge/Engineering/Databases/Sharding|database sharding]]. It's challenging to shard relational databases.

## Data Modeling
Although non-relational databases don't have tables, rows and columns, and are often chosen in anticipation of changes to the data model, you still need to have a concrete idea of what the data model/schemas for your application look like. 

### Don't Nest Deeply
*Don't nest deeply* is a usual best practice for designing document schemas.

When you fetch a document or part of a document, *you fetch everything inside it*. In the case of managed databases like Firebase realtime db, the permissions applied to a document or a part of it also apply to the children. When your data actually belongs together all or most of the time, it's okay and encouraged to nest them to avoid having to do multiple queries. When this is not the case, you overfetch data. In fact, managed DBs might enforce a limit on document size (1MiB for Firebase).
```json
{
  "users": {
    "Andrew": {
      "email": "..."
      "blogs": {
        "Why I love C": {...},
        "Why I hate JavaScript": {...},
        // ... and so on. This could be a huge list of blogs and all their contents!
      }
    }
  }
}
```
If you fetched `Andrew`, you'd also fetch all his blogs regardless of whether you needed them to render your UI or not. To improve this model, see [[Knowledge/Engineering/Databases/NoSQL#Normalisation vs. Denormalisation|normalisation/denormalisation]].

### Normalisation vs. Denormalisation
See [[Knowledge/Engineering/Databases/Normalisation|normalisation]]. *Denormalisation* is duplicating data to simplify queries. It's encouraged by [Firebase](https://www.youtube.com/watch?v=vKqXSZLLnHA&ab_channel=Firebase) when you want to improve read performance.

When you want to avoid nesting deeply, aim to **flatten** your data structures by extracting out nested JSON sub-structures in your document schema to separate collections, then linking them together through IDs or other fields. Doing this means that those two collections can be fetched independently, which improves read performance and query simplicity.
```json
{
  "users": {
    "Andrew": {
      "email": "..."
      // References to data elsewhere.
      "blogs": [          
        "Why I love C",
        "Why I hate JavaScript",
        // ...
      ]
    }
  },
  "blogs": {
      "Why I love C": {...},
      "Why I hate JavaScript": {...},
      // ...
  }
}
```

When you flatten data structures however, you inevitably increase *data duplication* or *redundancy* where the same data appears in multiple locations in the database. This is very common and often unavoidable in non-relational databases. 

Generally, when denormalising, you are **improving read performance at the cost of write performance** because it takes extra work to propagate updates to maintain [[Knowledge/Engineering/Databases/ACID|database consistency]] and correct stale data. The act of propagating updates to maintain consistency is called '*multi-path updates*' which helps to correct stale data/references or remove *orphaned references* (also called *dangling references*) which are references to deleted documents still held by other documents.

You must balance your usage of both normalisation and denormalisation. When deciding whether to nest or not to nest, you must think about your business requirements:
- In displaying your UI, would flattening your document schema minimise frequent over-fetching of data? Or would nesting make more sense because the data is tightly coupled together and therefore should be fetched in one query?
- How often users will need to perform a certain read query? If the answer is *very frequently*, then prefer denormalising.
