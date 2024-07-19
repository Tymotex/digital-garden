---
title: HTTPS
---

HTTP (Hypertext Transfer Protocol) is the main protocol for sending and receiving web traffic between web servers and browsers. In regular HTTP traffic, senders will send plaintext packets to the receiver. At any point, a person can capture the packet and see its contents. This is not a big deal if you're sending packets without any sensitive or valuable info.

HTTPS, *Secure HTTP*, is HTTP but with encryption. The same attacker can intercept and try to inspect your HTTPS packets, but they can't hope to make sense of any of it because it's encrypted. This is the reason that online transactions or login requests, for example, are able to be conducted without much security fear.
- Majority of websites use HTTPS even if they don't deal with sensitive user data. Browsers like Chrome will flag sites without an SSL certificate as insecure and penalise them in search ranking.

How does HTTPS encrypt the data? By using a protocol like [[Knowledge/Engineering/Networking/SSL|SSL]] or [[Knowledge/Engineering/Networking/TLS|TLS]]. more commonly now (a successor to SSL) to provide the encryption.

