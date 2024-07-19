---
title: Monitoring
description: Monitoring
---

Monitoring is about tracking system parameters so that the health of the system is known. 

## Alerting
Alerting is a feature made possible by a monitoring system. When a parameter's value exceeds a threshold, a few things might happen:
- Logged. It's non-severe, but could be important for troubleshooting.
- Generates a ticket. Needs to be looked at, but not urgent enough to immediately investigate.
- Last resort: a notification is pushed to an on-caller for timely manual intervention.

> In alerting systems, optimise for high signal-to-noise ratio, i.e. only page on-callers when there is very little doubt that something needs to be solved both urgently and with manual intervention.

## White Box vs. Black Box Monitoring
White-box monitoring is about monitoring metrics internal to the system. Black-box monitoring is about probing the service as close as to how a client would use it.
- White-box is typically used more than black-box.
- Black-box tends to be symptom-oriented, meaning it's there to tell you something is wrong, but isn't as valuable during troubleshooting.

## Metrics
The main metrics to monitor are:
1. **Latency** — time taken to respond to a request.
2. **Traffic load** — queries per second.
3. **Error rate** — incorrect responses and server error responses, such as HTTP 500 for web servers.
4. **Saturation** — memory usage/utilisation, CPU usage/utilisation, network bandwidth, storage usage, etc.






TODO: observability vs. APM vs. monitoring