---
title: Grafana
description: Grafana
---

![[Knowledge/Engineering/Technologies/assets/grafana-wallpaper.png|800]]
[Grafana](https://grafana.com/) is an open-source dashboard for data visualisation. It's commonly used in tandem with [[Knowledge/Engineering/Technologies/Prometheus|Prometheus]], using [[Knowledge/Engineering/Technologies/Prometheus#PromQL|PromQL]] to query its data.



Questions:
- What are time series.
- What are metrics.
- How do I group by a specific column/field in PromQL?
- What exactly is time-series database? How does it differ?


Grafana visualises metrics and logs.

## Grafana Managed Alerts

When the alerting conditions are satisfied, Grafana notifies a *contact point*, like Email, PagerDuty, Slack, etc. to notify and escalate to a human.

