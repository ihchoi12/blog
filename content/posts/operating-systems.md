---
title: "Operating Systems"
date: 2021-06-29T08:58:30Z
draft: false
---

# Some Terminologies
- Preemption: forcefully pause a running process (with PCB stored for resume later) and take the next ready process to the CPU 
- (CPU) Time Quantum: a time slot (duration) assigned to a process to use CPU (once expired, preemption happens)
- Degree of Multi-programming: the max # of processes in ready that RAM can hold at a time

# Context Switching 
Interrupts (e.g., from H/W or higher priority process) cause the OS to change a CPU from it's current task to run a kernel module called dispatcher, which happens frequently. The dispatcher saves context (represented in the PCB) of the currently running process, and restore context of the interrupting process. It happens during the CPU preemption. Note that the CPU is not running any process during the context switching, so it's a pure overhead (typically it's a few ms). 

# How process (or program) works?
##### Life-cycle of a program
- I write a program *hello.c* (high-level)
- *hello.c* is given to the compiler
- Compliler convert the high-level language to a low-level language, *a.out* (executable on the machine)
- Operating system does not take high-level language, but it can understand low-level language to run on HW
- Here, *hello.c* and *a.out* are **programs** residing in the hard-disk memory i.e., secondary memory.
- Now, OS takes a program and put it in the RAM (main memory) to execute
- When a program is put on the main memory, it will create a data structure ==> This is the **process**
- **Process**: something created by the OS in order to execute a **program**.

##### Process in the main memory (the date strucutre)
- Stack: for function call (grow downwards)
- Dynamic allocation (i.e., heap): to be used by the process at some point when needed (grow upwards)
- Static variables (variables remained forever thoughout the life-time of process)
- Executable code (*a.out*)
------------
- On this structure, CPU takse the lines in *a.out* one by one to execute, while referring some points in the above memory on demand
- OS make sure to never access beyond the boundary of the process in the memory (otherwise, segmentation fault) 

##### Attributes of a process (maintained in PCB of the process)
- Process ID
- Program Counter: what is the next instruction to be executed?
- Process State: ready, running, blocked, etc.
- Priority
- General Purpose Registers: registers are multiplexed by multiple processes, so a preempted process need to store the state of them so that it can restore them again when it preempts again
- List of Open Files: to keep it across preemptions
- List of Open Devices: to keep it across preemptions
- Protection: prevent a process from accessing other processes' data
* OS maintains the linked-list of PBCs

##### Two types of time of a process
- CPU time
- I/O time (I/O can be perforemd w/o RAM, so the process can be in disk during this time)

##### States of a process
- New (when the process is being created by OS, => program is being taken from disk)
- Ready (once the creation of process is completed, # of ready processes RAM can hold at a give time is limited => process is on the RAM)
- Run (the ready process has been chosen out of other ready processes according to the strategy, and is running => process is on the RAM)
- Block or Wait (when the process is in I/O time or waiting for other resources currently unavailable, so doesn't need for CPUs. Once finishes I/O or using other resources, go back to Ready state. => process is on RAM)
- Termination or Completion (once the process is done, the process will be killed and it's all traces like PCB context are deleted => process is deleted from RAM)
- Suspend Ready (the process was in Ready, then a new important process is created making RAM reaches degree of multi-programming, and this process is the least important according to the scheduling algorithm, so it's kicked out to the disk and is waiting to be restored => process on disk)
- Suspend Wait or Suspend Block: (similar as Suspend Ready, but kick out Block state process instead of Ready, which is more reasonable => process on disk)
------------
State transitions happen by OS or intrinsic logic of the process

##### Operations on process
- Creation: the process is placed on RAM and becomes ready
- Schedule (dispatch): the process is chosen and assigned to use CPU
- Execute: the process is executed by CPU
- Killing/Delete: the process is over

##### Time parameters of a process
- Arrival Time: time at which the process enters into the ready state (ready queue)
- Burst Time: the amount of CPU time required by the process to be completed (it's practically difficult to estimate before execution)
- Completion Time: time at which the process finishes
- Turn Around Time: Completion Time - Arrival Time
- Waiting Time: time during which the process is waiting (to use CPU) in the ready queue or wait state 
- Response Time: the first time at which the process is scheudled (dispatched) to CPU == duration of the first Waiting Time
-----
Turn Around Time = Completion Time - Arrival Time = Total Burst Time + Total Waiting Time

# Schedulers
### 3 types of schedulers in state transitions 
All of them affects performance
##### Long-term: 
- At *New* state. 
- How many processes should be created (this decision lasts for the entire process).
- It decides the degree of multi-programming. 
- Affects system performance significantly (should balance CPU-bound and I/O-bound processes for better performance). 
##### Short-term: 
- At *Ready* state
- which ready process to schedule (this decision lasts only during the *Run* state). 
- Then, dispatcher handles the context switching.
- Good short-term scheduler make the decision such that minimizes the context switching time (which depends on the size of context to be changed)
##### Medium-term: 
- At *Ready* or *Block* state, 
- Whether to suspend a process or not
- Suspension of a process cause *swapping* -- moving a process from RAM to disk, and getting it back
- Good midium-term scheduler minimizes the swapping overheads

## Process scheduling
The objective of multi-programming is to have some processes running at all times, to maximize CPU utilization. Also, the objective of time sharing is to switch the CPU among processes so frequently that users can interact with each of running processes. To achieve these, the **process scheduler** selects one of **ready** processes to be executed on the CPU. 

### Scheduling queues
Process scheduler has two types of queue to implement the scheduling. 
- Job queue: As processes enter the RAM, they are put into the job queue, which consist of all processes in the system 
- Ready queue: Once a process is ready and waiting to execute, it's moved into the ready queue

<p align="center">
    <img src="/posts/img/process-scheduling.png" width="500"/> <br>
    <a href="https://www.youtube.com/watch?v=2h3eWaPx8SA">[source]</a> 
</p>

Then, OS selects a process from the ready queue (according to the scheduling algorithm), and assign the CPU to the process. Here, 3 cases can happen:
1. The process completes execution and becomes terminated state (ends)
2. Another process with a higher priority comes into the ready queue, so it gets swapped-out and into the list "partially executed and swapped-out processes", and then swapped into the ready queue again
3. The process needs to use some I/O devices (e.g., PCIe devices), so it becomes **I/O Wait** state and get into I/O waiting queues. Once the I/O devices is available, it executes the I/O operation and go back to the ready queue.


### Scheduling Algorithms
##### FCFS
- Criteria: the earlist arrival time
- Mode: non-preemptive
- Disadvantage: Convoy effect (a process with high burst time and low arrival time can cause later processes wait for long)
- Queue is a suitable data structure to implement this with O(n)
##### SJF
- To solve Convoy effect
- Criteria: the shotest burst time (among the available process at the time) 
- Mode: non-preemptive
- The Convoy effect is not removed completely (ex. a high burst time process arrives a bit earlier than some low bursr time processes)
- Min-heap is a suitable data structure to implement this with O(nlogn): logn for insertion or deletion
- Known to be the best scheduling algorithm, but practically difficult to implement (why? hard to know the burst time before execution), so normally use it as a theoritical benchmark to compare with
- Advantages
  + Max Throughput (at any point of time). Why? Processes will be completed as early as possible 
  + Min Avg WT & TAT
- Disadvantages
  + Starvation to longer tasks
  + Not implementable in practice
- (For approximate implementation) SJF with predicted BT. How to predict:
  + Static: based on either process size or type (e.g., OS, user, foreground, background, etc.)
  + Dynamic: based on simple AVG or exponential AVG

##### Round Robin
- FCFS with preemption
- Most popular with various advantages:
  + Practically implementable (not depending on the burst time)
  + Implementable with a simple data structure like Queue
  + No starvation
- Excute a schedule process for only a particular time quantum (TQ), then preempt
- Queue is a suitable data structure to implement the ready pool
- The longer TQ, the less context switching (but more starvation, larger Response Time, so we should seek for balance)
- TQ is infinite => FCFS


##### LJF
- Criteria: BT => Arrival Time
- Mode: non-preemptive
  
 
  
  



# Introduction
### What is OS?
- Interface between user and HW (help to generate system calls as user wants)
- Resource allocator (resource should be shared by many users or programs, or should be scheduled if not shareable)
- Manager for memory, process, files, security (e.g., resource isolation), etc.

##### History
- evolve with Computer HW, app, and usage pattern 
- There was NO OS for the first computers (e.g., ENIAC, Harvard Mark1) => not portable apps, inefficient

### Goal of OS
- Convenience (e.g., for personal computer)
- Efficiency (e.g., for servers)
- Abstractions: users don't want to care about low-level details of large variations in HW configurations 
- Programmability, Portability
- Manage resources and coordination

### Type of OS
##### Batch OS: 
- Single computer, queue of jobs (FIFO),
- Can move on to next job iff the previous job is finished (starvation: waste of idle resource e.g., CPU or I/O), low efficiency
- Not interactive since an interactive process has to wait until all previous jobs are finished 
##### multi-programming w/o preemption
- It has multiple processes in 'Ready' state
- When a job is taking I/O resource but not CPU, the other job can take CPU (i.e., no CPU idle time)
##### Time-sharing OS
- allow multiple users to interact with machine
- User job shceduling => illusion of concurrency 
- memory management 
- Virtualization of HW: each program executeds as if it has all the resources to itself (actually not) 
##### multi-tasking: multi-programming with preemption
- Also called Time Sharing
- CPU can be multiplexing multiple jobs even before completing them (i.e., preemptive) 
- Interactive 
##### multi-processing
- Have multiple CPUs
- Many processes can be supported simultaneously
- Differences from multiple computers: other resources (memory, etc.) can be shared, so less costly and more efficient
- Throughput improved
- Higher reliability (tolerant to some CPU failures)
- Each CPU can be operated as we want (batch? multi-tasking?)
##### Real-time
- Requested jobs will be having some deadlines
- If fails to meet the deadline, results can be discarded

### OS Services
- OS provides program execution environment and services for the programs and users
- So, which services are provided?
  + User Interface: to allow users to interact with OS
    * CLI: user provides text-based commands to perform certain tasks by OS
    * GUI
  + Program Execution: load a program to RAM, and run it
  + I/O Operations (in between processes and I/O devices)
  + File System Manipulation
  + Communications (between processes)
  + Error detection (on the entire system)
  + Resource Allocation
  + Accounting (which user is using how much and what kind of resources)
  + Protection and Security (even in a processes scale)

##### User-OS interface
- Some OS include the CLI in the kernel (the heart of OS)
- But many OSes (e.g., Windows, Unix) treat the CLI as a special program
- On systems with multiple CLIs, the command interpreters are known as shells
  + Bourne Shell
  + C Shell
  + Bourne-Again Shell (BASH)
  + Korn Shell
  + etc.
- Two approaches for executing the commands entered by user
  + Command interpreter contains the code to run the tasks, so interpreter itself executes the code
  + Command interpreter does not contain any codes, but the codes are written in certain programs, so the interpreter calls the program based on the entered commands  

##### System Calls
- Provide an interface to the services provides by OS
- Two modes of operations where programs are executed
  + User mode
    * programs do not have direct access to the resources like memory, HW.
    * If a program running on user mode crashes, the entire system does not crash (safer)
    * most of programs are executed in user mode
  + Kernel mode (privileged mode)
    * programs have direct access to the resources
    * If a program running on kernel mode crashes, the entire system will crash
- If a user mode program needs to access the resources, it makes a call (system calls!) to OS to request that ==> Then, the program is switched to kernel mode (called Context Switching), so that it can access the resource
- Definition of System Call: The programmatic way in which a computer program requests a service from the kernel of OS. These calls are generally written in C or C++.


# References
- https://www.youtube.com/watch?v=2i2N_Qo_FyM
- https://www.youtube.com/watch?v=2h3eWaPx8SA