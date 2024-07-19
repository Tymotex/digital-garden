---
title: VPN
---

VPN (virtual private network) is a service that you can make network requests in a way that is anonymised from external parties like the government.
![[Knowledge/Engineering/Networking/assets/vpn-diagram.png|500]]

When you visit a webpage, under the hood you are transmitting network packets that also contain a lot of personal information like your IP address. VPN encrypts the data in your network packets (although if you're sending/receiving HTTPS traffic then it's already encrypted).

When you visit a webpage while using a VPN, your request is first forwarded to the VPN's servers who then forwards your request to the actual website's server. The VPN acts a middleman between source (you) and destination.

Connecting to a VPN in a different country enables you to mimic being a client in that country, allowing you to bypass geolocation restrictions. Some good use cases for this:
- When buying goods or services, there may be location price discrimination, meaning that you can buy the same goods/services at cheaper prices if you were detected as being from another country.
	- Useful for flights and accommodation.
- Bypassing government censorship, e.g. If you're in China trying to access Google services.

VPNs usually don't retain logs of your activity so no external party like the government or other companies can request them.
- VPNs can't completely forgo logging, no matter their claims about a zero logging policy. Some countries (like Australia) have mandates that ensure your VPN retains some activity logs and to make them accessible by the government.
- VPNs can access your personal information before they encrypt it. It's impossible to have 100% privacy. In the end, your network activity is always visible to at least your ISP or your VPN, never no one.
- Free VPNs are probably selling your data to 3rd parties to fund their operations.

Differences between different VPN providers?
- Different VPNs have different reputation. Some are involved in shady practices, some are pricier but with better reputation, etc.
- Some VPNs offer their services in more countries than others.
