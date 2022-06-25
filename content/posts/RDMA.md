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


# Infiniband (IB)
- Industry standard defining I/O architecture 
- Used to interconnect compute nodes, communication equipments (e.g., switches), storage, and embedded systems
- Independent of host OS
- Designed to accelearate all protocol layers (Physical - Link - Network - Transport - Upper) to achieve maximum network utilization and performance
- Deployed in data centers, cloud computing, HPC, ML/AI 

### Main components
<p align="center">
    <img src="/posts/infiniband-components.png" width="300" /> <br>
    <a href="https://academy.nvidia.com/course/view.php?id=480">[source]</a> 
</p>


- IB switches: Move the traffics
- Subnet Manager: Manages all network activities
- Hosts (end-nodes): The clients of IB fabric
- Host Channel Adapter (HCA): Enable an IB connection between the host and IB switches
- IB to Ethernet Gateway: Allows for IP traffic exchanges between IB and Ethernet based networks
- IB Router: Allows for inter-connectivity between multiple IB subnets

### SHARP
- Scalable Hierarchical Aggregation and Reduction Protocol
- In-network computation technology
- Offloads collective operations from the host CPUs or GPUs to the network switches
- As a result, it dramatically improves performance of accelerated computing, MPI based applications, such as ML/AI. 

### Key Features
- Simplified Management
    - IB is the first architecture to truly implement the vision of SDN
    - IB is managed by a subnet manager which is a program that runs and manages the entire network
    - Subnet manager provides centralized routing management, hence enables PnP of nodes
- High Bandwidth
- H/W Offloads
    - RDMA using Kernel Bypass and H/W (NIC) based transport porotocol
    - In ML/AI, GPU Direct RDMA
- Low Latency
    - Thanks to NIC offloading and accleration techinques on the NIC, end-to-end latency is extremly low (e.g., 1us) 
- Easy Network Scale-out
    - Capable to deploy up to 48K nodes on a single subnet
    - Further, multiple IB subnets can be interconnected using IB routers
- Quality of Service (i.e., ability to provide different priority to different apps, users, and data flows)
    - IB switches have multiple port queues with different priorities
    - flows are mapped to a different port queue depending on the priority 
- Fabric Resiliency
    - Link failures require traffic re-route
    - Subnet manager can take about 5 seconds for this
    - IB has a feature called Self-healing Networking: H/W based capability of Nvidia switches enabling 5000x faster link failure recovery
- Optimal Loadbalancing
    - Necessary for high bandwidth utilization
    - Use Adaptive Routing: equalize the amount of traffic sent on each switch port
    - Nvidia switch H/W has Adaptive Routing Manager 
- MPI Super Performance with SHARP
- Spport Various Topologies
    - Fat-tree, Torus, Hypercube, HyperX, Drangonfly +, etc.



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
