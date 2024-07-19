---
title: "SLIs, SLOs, SLAs"
---

In the context of SRE, we should be precise about the differences between SLI, SLO and SLA.
- SLI, service level indicator — a measurable metric of the service, e.g. availability, request latency, error rate, throughput, etc.
- SLO, service level objective — a specific target value for an SLI. E.g. "the SLO for average request latency should be less than 100ms."
    - We measure SLOs through a [[Knowledge/Engineering/SRE/Monitoring|monitoring]] service like [[Knowledge/Engineering/Technologies/Prometheus|Prometheus]].
- SLA, service level agreement — what SLOs are promised, and how the client will be compensated if that promise is broken (often through a financial rebate).

In summary: SLI is a metric, SLO is a target value, SLA is a promise that you'll deliver X or be punished with Y if you fail.
