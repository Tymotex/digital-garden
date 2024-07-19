---
title: SSL
---

SSL (Secure Sockets Layer) is a protocol for encrypting HTTPS traffic.

Even though [[Knowledge/Engineering/Networking/TLS|TLS]], the successor, is more widely used, we still say 'SSL certificates' instead of 'TLS certificates' for historical reasons.

See [[Knowledge/Engineering/Technologies/NGINX#LetsEncrypt|NGINX LetsEncrypt]] for a practical example of getting an **SSL certificate** for an Nginx web server.

## SSL Certificate
SSL certificates are issued by a [[Knowledge/Engineering/Networking/Certificate Authority|Certificate Authority]] (CA) and need to be periodically renewed.

An **SSL Certificate** is a file, typically stored in the web server's filesystem, which contains:
- Its public key. 
- Its private key
	- The web server keeps this secret. It's used to decrypt messages people send to the server that are encrypted with its public key.
- The website's info, like the domain name (e.g. www.timz.dev), location, etc.
- The issuing Certificate Authority's **digital signature** which lets your browser verify that the certificate is legit.
	- The digital signature is a string produced when the CA takes a hash (e.g. [[Knowledge/Engineering/Cybersecurity/SHA-256|SHA-256]] hash) of the SSL certificate and encrypts that hash with its private key.
	- Your browser pulls out the digital signature from the SSL certificate, and uses the CA's public key to decrypt it to get a hash value, then applies the hash function itself on the SSL certificate and if it reaches the same value, then the browser has confidence the certificate is legit.

![[Projects/_archive/Raspberry Pi Hosting/assets/ssl-digital-certificate-creation-and-usage.png|600]]

Browsers and operating systems are pre-installed with a list of CAs that it trusts.

## How Certificates Get Issued
The CA needs to:
1. Do a background check on the applicant to be sure of its identity and ownership over the domain. This can be done by checking with domain registrars.
2. If the background check succeeds, the CA creates the SSL certificate, creates a digital signature from it and sends it all over to your web server.

## How it Works
Initial Handshake:
1. Your browser asks the web server to identify itself.
2. Web server says "here's my SSL certificate".
3. Your browser and the web server exchange cryptographic keys and then the encrypted messages can start flowing back and forth.
	- Symmetric encryption is used, e.g. [[Knowledge/Engineering/Cybersecurity/AES|AES]].
	- As part of the handshake though, the key exchange may use asymmetric encryption like [[Knowledge/Engineering/Cybersecurity/RSA|RSA]] or [[Knowledge/Engineering/Cybersecurity/Diffie-Hellman|Diffie-Hellman]].
