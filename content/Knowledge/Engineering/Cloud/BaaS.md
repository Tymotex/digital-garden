---
title: BaaS
description: BaaS
---

*BaaS (backend as-a-service)* is a set of cloud services that you can use instead of writing your own backend for it. Standard features such as user authentication and cloud storage for user photos, videos shouldn't be an implementation priority since it's likely not central to your app's business value. BaaS vendors maintain all the infrastructure for the servers providing these standard backend services and give you SDKs that you can use to work with it directly from your frontend codebase.

It's a great option if you're a startup and must maintain very low operational costs while still building something that can eventually scale up to thousands of users.

![[Knowledge/Engineering/Cloud/assets/what-is-backend-as-a-service.svg|700]]
*(Sourced from [Cloudflare](https://www.cloudflare.com/learning/serverless/glossary/backend-as-a-service-baas/))*

Google's [[Knowledge/Engineering/Technologies/Firebase|Firebase]] is one example of a BaaS platform.
