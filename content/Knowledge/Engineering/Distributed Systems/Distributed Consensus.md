---
title: Distributed Consensus
---

*Consensus* is the process of getting groups of processes to agree on something. The point of it is to ensure data *consistency* in a distributed system — i.e. if a node sees a value as X, then all other nodes should also see it as X. In financial systems for example, this is critical.

Consensus algorithms help with things like leader election, where nodes need to agree on which node will be a leader (as part of a leader-follower architecture for a service, for example), ensuring locks are acquired and held by precisely one user, etc.

Distributed consensus algorithms help distributed systems achieve consistency.

## Paxos [TODO]
The Paxos algorithm, first described by Leslie Lamport, is used to get a distributed system's nodes to agree on one value despite failures. It's name is inspired by the Greek Paxos islands where Lamport imagined generals needing to communicate.

Basically, it's democracy — the majority of nodes have to agree on a value.
- There are proposers and acceptors. Proposers broadcast a value and acceptors will vote yes or no. When more than 50% have voted yes, consensus is reached.
    - Nodes can be both proposers and acceptors.
- All nodes are willing to 'change their mind' and agree to any value, provided that the majority agrees on it.
