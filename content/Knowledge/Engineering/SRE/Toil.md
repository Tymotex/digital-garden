---
title: Toil
---

*Toil* is the operational work involved in running a service that is repetitive, manually done and does not contribute enduring value to the service. Often, toil work is automatable. A fundamental aim of site reliability engineering is to minimise toil. The ideal is to end up with a system where the toil work does not scales sublinearly with service size, meaning that more demand on the service does not mean proportionally more work on the engineers backing that service.

Some examples:
- Refactoring code is not toil because this contributes enduring value to the service.
- One-time efforts like provisioning extra compute resources for a service is not toil.
- Manually deploying code to production is toil.
- Manually performing backups is toil.
