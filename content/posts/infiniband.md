---
title: "Infiniband"
date: 2022-06-25T03:34:25Z
draft: false
---


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


### Architecture
- IB architecture is divided into 5 layers, in a similar way to the traditional TCP/IP model
- But there are many differences between IB and IP protocol
- Traditionally, applications relied on OS for communications
- IB enables applications to communicate w/o directly involving OS (application-centric approch)
<p align="center">
    <img src="/posts/infiniband-rdma.png" width="300" /> <br>
    <a href="https://academy.nvidia.com/course/view.php?id=480">[source]</a> 
</p>

#### Layers
- Upper layer
    - Defines the methods for applications ("consumers" of IB) to access IB services
    - Provide standard protocol interfaces (e.g., MPI, NCCL, etc.) to applications  
- Transport layer
    - Unlike traditional TCP/IP (moving data from source node's OS to destination node's OS)
    - In IB, End-to-end virtual "channel" is created between two end applications
        - IB provides H/W based transport implemented by HCA
        - Once an application request transport of a message, the message is transmitted by the sending H/W HCA
        - When the message arrives to the receiving H/W HCA, its delivered directly into the receiving application's buffer 
- Network layer
    - So far, we discussed end-nodes
    - This layer describes the protocol for routing of pacekts between different subnets via IB routers
    - Routers use network later addresses (called GID: global ID) to route packets to the destination node
    - What if the packet is routed in the local subnet? see link layer
- Link layer
    - Subnet manager assigns each node in a subnet with an address called LID: Local ID
    - Subnet manager forms forwarding tables with entries of mapping between LIDs and egress ports, and programs it into IB switches 
- Physical layer
    - Eventually, data trasfers occurs when bits are transmitted over a physical medium 
    - This layer specifies how bits are placed on the wire and protocol to signal of valid packets
    - Also it defines specifications of copper and optical cables 
    - Note: aggregating multiple physical lanes enables higher bandwidth



#### Flow control mechanism
It's an element of the link layer in IB. The sender node dynamically tracks receive buffer usage and adjusts transmission rate, so that the receiver is not overloaded, enabling lossless network.

# References
- https://academy.nvidia.com/course/view.php?id=480

