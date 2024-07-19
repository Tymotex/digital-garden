---
title: Region
description: Region
---

### Regions
A *region* is literally a geographic region which contains 1 or more [[Knowledge/Engineering/Cloud/aws/Availability Zone|availability zones]]. AWS ensures that there are a minimum of 2 AZs in every region.

![[Knowledge/Engineering/Cloud/aws/assets/Region availability zone.png|500]]

AWS has around 26 regions and 84 availability zones distributed across the world.
- Regions typically have names like `us-east-1`, `us-east-2`, `ap-southeast-2` (Asia Pacific, Sydney), and so on. 
- Availability zones typically have names post-fixed with a character like `us-east-1a` and `us-east-1b`.

![[Knowledge/Engineering/Cloud/aws/assets/AWS availability zone map.png|500]]

Not all regions are equivalent. Some regions will access to services that are not available to others.
