---
title: Troubleshooting
---

> Always approach the problem with a rational and calm mind. It's tempting to make knee-jerk solutions that simply exacerbate the problem.

![[Knowledge/Engineering/SRE/assets/troubleshooting-flowchart.png|450]]
([source](https://sre.google/sre-book/effective-troubleshooting/))
1. Know the *expected* state and the *actual* state.
2. **Triage** — figure out the scope of the issue.
3. **Examine** — find misbehaving components. Use logs and graphs produced by the monitoring system.
4. **Diagnose** — 
5. **Test/Treat** — 

Don't jump to root cause analysis. The first priority is always to "make the system work as well as it can under the circumstances." I.e. **stop the bleeding first**.
> "Novice pilots are taught that their first responsibility in an emergency is to fly the airplane; troubleshooting is secondary to getting the plane and everyone on it safely onto the ground. This approach is also applicable to computer systems: for example, if a bug is leading to possibly unrecoverable data corruption, freezing the system to prevent further failure may be better than letting this behaviour continue." — Google SRE book.

This approach to troubleshooting roughly mimics the scientific method:
1. Hypothesis — make a conjecture.
2. What are the consequences you expect from this hypothesis?
3. Seek or produce evidence that confirms or refutes the hypothesis.
4. If the hypothesis fails, propose a new one and repeat.

Beware of confusing correlation for causation.
> "Some correlated events, say packet loss within a cluster and failed hard drives in the cluster, share common causes — in this case, a power outage, though network failure clearly doesn't cause the hard drive failures nor vice versa. Even worse, as systems grow in size and complexity and as more metrics are monitored, it's inevitable that there will be events that happen to correlate well with other events, purely by coincidence." — Google SRE book.
