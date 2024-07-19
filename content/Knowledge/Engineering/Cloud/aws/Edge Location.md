---
title: Edge Location
description: Edge Location
---

*AWS edge locations* are [[Knowledge/Engineering/Cloud/aws/Data Center|data centers]] owned by trusted 3rd party, called an *AWS Partner*, that uses [[Knowledge/Engineering/Cloud/aws/CloudFront|CloudFront]]. Together, the edge locations form the *edge network* between AWS and end users.

When a user makes a network request to one of your services, the request goes to the edge location that has the lowest latency to reach. From there, cached content might be served back, or the edge location forwards the request to the *origin server* (which might be an S3 bucket, for example). This reduces the total **number of hops** between routers that a network request would otherwise need to go through in order to reach your service.
