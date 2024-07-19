---
title: Home Internet
---

TODO.

## Setting Up Home Internet
1. Look at which [[ISPs]] actually work for your address. They each offer plans with different speeds, different prices, etc.
2. Consider these factors below and pick an ISP and a plan. In Australia, typical ISPs are Optus, Telstra, Aussie Broadband, etc.
	- Download speeds.
	- Upload speeds.
	- Connection types (DSL, cable, fiber-optic, satellite). Fiber-optic tends to be the best for speed and reliability.
	- Price.
	- Contract fine print. Are they lock-in?
	- Reputation and support quality.
1. You need a modem. Your ISP will give you one, or rent you one, or you buy one yourself. If being provided a modem, someone from your ISP might come over to assist with installing it.
	- If picking your own, it needs to be compatible with your ISP.
2. You need a router. Your ISP might also give you one, or it might be built into the modem.
	- Provides a firewall.
	- Runs a [[Knowledge/Engineering/Networking/DHCP|DHCP server]] which assigns IP addresses to all of your devices.
3. (Optional) Get a switch, if you have more wired devices than the number of Ethernet ports available on the router.

Example of how all the devices fit together:
![[Knowledge/Engineering/Networking/assets/home-internet-connection-setup-diagram.png|700]]
## Modem
Modems connect your home to the internet. Routers connect your devices to the modem.

Modems are configured to establish a connection to your ISP's servers.

Modems (modulator-demodulators) are used to convert digital signals to analog, since communication media like copper wires or fiber optic cables can only transmit analog signals. Your devices can probably only work with digital signals, so the modem converts analog to digital for traffic coming in.

## Router
Routers are responsible for:
- Firewall, which secures the traffic coming into your network.
- Uses [[Knowledge/Engineering/Networking/NAT|NAT]], which maps a single public IP address to multiple devices.
- Routes your outgoing traffic efficiently to reach destinations.
- Serves a web frontend where you can configure things like password, security, monitoring, etc.
- Makes Wi-Fi communication possible.
- Port forwarding, where incoming traffic can be directed to a specific device.
- Set up QoS (Quality of Service) rules, which let you prioritise certain types of traffic, like streaming.

## NBN
NBN (National Broadband Network) is the Australian government's attempt at building a country-wide telecommunications infrastructure for homes and workplaces.
- 'Broadband' refers to technology that has superseded older technologies like dial-up or ISDN. It's basically just fast internet access technology.

NBN consists of:
- Fiber-optic cables.
- Satellite services.

NBN offers a few connection types:
- **FTTP (Fiber to the Premises)** — the fiber optic cable goes directly to your home/workplace.
- **FTTC (Fiber to the Curb)** — the fiber optic cable goes to a thing near your home/workplace, then copper wires go to that thing to your home.
	- **FTTN (Fiber to the Node)** — FTTC, but closer to your home/workplace.
- **HFC (Hybrid Fiber-Coaxial)** — usage of both fiber and coaxial cable.
- **Fixed Wireless** — when fiber isn't feasible, wireless transmitters are used.
- **Sky Muster (Satellite)** — for remote areas where fiber isn't feasible.

## Switching ISPs
1. Check if you are in a lock-in contract or if there are penalties for leaving.
2. You may need a new [[Home Internet#Modem|modem]] or [[Home Internet#Router|router]].
	- Your modem may be part of a lock-in contract. Leaving means paying out a fee so that you can keep that modem.
3. Your new ISP does the work in kicking out your old ISP, so there should be minimal downtime.
