---
title: Terraform
description: Terraform
---

![[Knowledge/Engineering/Technologies/assets/terraform.png|700]]

[Terraform](https://www.terraform.io/) is an *infrastructure as code* technology that you can use to automate your infrastructure setup. All you do is define the things you want to spin up in a `.tf` file, such as [[Knowledge/Engineering/DevOps/Virtual Machines|VMs]], [[Knowledge/Engineering/Architecture/Load Balancer|load balancers]], [[Knowledge/Engineering/Technologies/Kubernetes|K8S clusters]], a [[Knowledge/Engineering/DevOps/VPC|VPC]], etc. using Terraform's [[Knowledge/Engineering/Programming/Programming Paradigm#Declarative|declarative]] language. Terraform uses your API credentials to spin up everything you declared in the `.tf` file. Terraform has a rich plugin ecosystem and it's usable on all the main [[Knowledge/Engineering/Cloud/Cloud Provider|cloud providers]].
