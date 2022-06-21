---
title: "RDMA"
date: 2022-06-20T15:31:53Z
draft: true
---

# Terminologies
- Infiniband (IB): consist of IB adapters and switches
- RoCE: 
    - RDMA using an Ethernet switched fabric instead of IB
    - Although it uses an Ethernet layer, it has nothing to do with TCP/IP layers

# RDMA
Advantages: lower latency, CPU bypass


# Basic Concepts
<p align="center">
    <img src="/posts/rdma-diagram.png" width="300" /> <br>
    <a href="https://www.infinibandta.org/roce-and-infiniband-which-should-i-choose/">[source]</a> 
</p>

- OFA s/w: open source s/w stacks provided by the Open Fabrics Alliance which supports RDMA



# Reference
- https://www.infinibandta.org/roce-and-infiniband-which-should-i-choose/
