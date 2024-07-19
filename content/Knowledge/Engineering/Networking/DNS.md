---
title: DNS
description: DNS
---

DNS (domain name system) is a [[Knowledge/Engineering/Distributed Systems/Distributed Systems|distributed system]] that maps **domain names to [[Knowledge/Engineering/Networking/IP Addresses|IP addresses]]**, e.g. a DNS query for `timz.dev` can resolve to `76.76.21.21`. Think of DNS as a distributed database, actually. The whole point of the DNS system is to allow for you to talk to computers through human-readable domain names. That extra layer of indirection also allows for more security and for changing the underlying machine without affecting users (`timz.dev` could be migrated to a different host).

The DNS system consists of a globally spanning network of **DNS servers**, also called **name servers**, each of which is responsible for handling the mappings belonging to their part of the **hierarchical namespace**. 
- Nameservers are just machines that have a process running that listens to incoming DNS requests.
- At each non-leaf node, a DNS request can be forwarded to the appropriate child. The leaf nodes are the **authoritative name servers**, which actually store the domain name to IP address mappings in a file on their filesystem. *In resolving a DNS request, you are simply traversing this tree on a path to a leaf to get your answer*.
![[Knowledge/Engineering/Networking/assets/hierarchical-namespace.png|500]]

Initially, all domain name to IP address mappings were stored in a single `hosts.txt` file managed by Stanford Research Institute. This centralised approach DNS system clearly wouldn't scale well, so now we have a distributed network of name servers instead.

## DNS Resource Records
Authoritative name servers hold *resource records* for each domain name it manages. They're just some important information the nameserver knows about the domain. They're kept in a 'zone file' on the nameserver's file system.

There are different kinds of resource records:
- **A** — the direct domain to IP address mapping.
- **CNAME** — a domain alias, e.g. mapping `www.foo.com` to `foo.com`.
- **NS** — the authoritative nameservers for a domain. This is what is telling the DNS resolver which DNS server it should hop to next in their domain name resolution.
- ... and others like MX, TXT, etc.

Resource records have a TTL (time to live) field which instructs the resolver on how long it should cache that knowledge for.

## DNS Resolution
Suppose you want to visit `timz.dev` for the first time.
1. You start a Chrome web browser process and search for `timz.dev`.
2. Chrome asks the **local DNS resolver** for the IP address of `timz.dev`.
    - The local DNS resolver is just a process running on your machine, or in your local network, which helps you resolve DNS requests.
3. If the mapping doesn't exist in the cache, the DNS resolver forwards the request to the **root DNS server**.
4. The root DNS server tells the resolver which TLD DNS server for `*.dev` to talk to.
5. The TLD DNS server tells the resolver which authoritative nameserver to talk to.
6. The authoritative nameserver gives the resolve the IP address, which it caches for next time.

There are 2 ways resolution happens — *iteratively* or *recursively*.
![[Knowledge/Engineering/Networking/assets/iterative-vs-recursive-dns-resolution.png|700]]
([source](https://gaia.cs.umass.edu/kurose_ross/interactive/dns_query.php))

## DNS Protocol
The DNS protocol is an [[Knowledge/Engineering/Networking/OSI Model|application layer]] protocol. Just like HTTP or SMTP, it works in a request/response manner and packets have a header component and a payload component.
- Even though DNS queries should use a reliable transport protocol from a user perspective, it uses typically uses UDP over TCP for better performance and for reducing the load on nameservers. Reliability is ensured by re-sending requests on timeout at the application layer
    - TCP would be way too slow. Imagine a DNS query where the local name server needs to talk to 5 other nameservers. This would be mean 5 connections have to be established sequentially.
- DNS nameservers listen on port 53, its standard port.

![[Knowledge/Engineering/Networking/assets/DNS-protocol-packet-diagram.png|500]]

# Flashcards
- What is the hierarchical namespace?
    - It's a big tree consisting of domain levels. At each non-leaf node, the DNS query is forwarded down until it gets to a leaf node, i.e. an authoritative nameserver, that actually holds the domain name to IP address mapping.
- Explain the steps that happen in order for a web browser to visit `timz.dev` for the first time.
    - The web browser asks the local DNS resolver for the IP address of `timz.dev`. The local DNS resolver then asks the root nameserver for the IP address. The resolver gets told to go to a TLD nameserver and ask for the IP address of `timz.dev`. The resolver gets told to go the authoritative nameserver, who contains the A record (the direct mapping from domain name to IP address). The resolver tells the browser its answer and the browser begins to establish a connection and request resources via HTTP.
- Does the DNS protocol rely on UDP or TCP?
    - It relies on UDP typically. Because it needs to talk to so many different machines, TCP would be a bit too slow.
