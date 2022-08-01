---
title: "RDMA"
date: 2022-06-25T03:34:25Z
draft: false
---

# hi please

# Terminologies 
- Infiniband (IB): consist of IB adapters and switches
- RoCE: 
    - RDMA using an Ethernet switched fabric instead of IB
    - Although it uses an Ethernet layer, it has nothing to do with TCP/IP layers


# RoCE
- RDMA over Ethernet
- Mellanox Ethernet adapter (e.g., CX5) enables you to run RoCE on any ethernet fabric setting 
- Mellanox Ethernet Spectrum switches acccelerate RoCE performance 
- For example, NVMe over Fabric (NVMe-oF) uses RoCE to provid remote memory access at the same performance level of local memory access, which enables users to centralize pools of SSD rather than placing them on every server 


### Over Lossy Fabric
- Lossy Fabric: a fabric which doesn't enforce Priority Flow Control (PFC)
- Originating from IB, RoCE traditionally required lossless fabric
- Since CX4, Mellanox enables RoCE over lossy fabric as well
- How? Use H/W based congestion control mechanisms of Mellanox NICs to make the network from lossy to lossless
    1. Enable Explicit Congestion Notification (ECN) on a switch using a single CLI command
    2. When the switch's queues begin to fill up, they add ECN mark to received IP packets
    3. Once these ECN marked packets arrive to the receiver, it notifies the sender to slowdown sending rate by sending CNP marked packets
    - This approach reduces the reaction time to congestion notifications to 10s of ns (x1000 faster than S/W based approach)
    - Also, using this approach, RoCE shows a small (or 0) difference on performance in lossy and lossless fabrics
    - Over this network, we can add a priority mark to classify RoCE traffic from others to enable QoS or other configurations for RoCE traffic only (this can be done over layer 2 marking PCP TAG, or over layer 3 marking DSCP TAG)


# RDMA
Advantages: lower latency, CPU bypass


# Basic Concepts
<p align="center">
    <img src="/posts/img/rdma-diagram.png" width="500" /> <br>
    <a href="https://www.infinibandta.org/roce-and-infiniband-which-should-i-choose/">[source]</a> 
</p>

- OFA s/w: open source s/w stacks provided by the Open Fabrics Alliance which supports RDMA

## Verbs
- Two sided (channel semantics)
    - Send/Receive
- One sided (memory semantics)
    - Read/Write: the initiator specifies the source or destination location, w/o involving the other end CPUs.



# Reference
- https://www.infinibandta.org/roce-and-infiniband-which-should-i-choose/
- https://academy.nvidia.com/mod/scorm/view.php?id=8214
