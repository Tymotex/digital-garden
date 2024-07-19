---
title: Canary
---

In canary rollouts, a small number of the servers are updated to have the new binary. Those updated servers serve only a tiny sliver of user traffic. If everything goes okay for a while (we call this the incubation period, or "baking the binary"), then we continue to roll out the update to exponentially more servers until the update is fully rolled out.

At any stage if failures in the system are detected, then the rollout is immediately reversed.
