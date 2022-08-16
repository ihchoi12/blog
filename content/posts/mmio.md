---
title: "MMIO"
date: 2022-08-16T13:28:59+08:00
draft: false
---

# Memory: On-chip vs Off-chip
- On-chip (SRAM): 
    * Storage on the processor chip to decrease latency for critical/ frequently used data
    * Works as a cache for the main memory(DRAM)
    * Usually single cycle access
- Off-chip (DRAM): 
    * Much cheaper than SRAM
    * Usually has much more latency (5–15 cycles) 

# Memory Space
- The memory space is devided into 6 pre-defiened regions
    * Code: 
        * Typically, on-chip flash (not on-chip SRAM)
        * To store program code or data
    * SRAM:
        * Primarily used to store data (e.g., heaps, stacks), or code
    * Peripheral
    * External device
    * External RAM 
    * System

# Interfacing Peripherals
- Usually, each on-chip peripheral device has a few registers (e.g., control. status, data input, and data output regsiters)
- Two approaches to exchange data between a processor core and a peripheral: 
    * Port-mapped I/O: 
        * uses special CPU instructions specifically designed for I/O operations: *Special_instruction Reg, Port*
    * Memory-mapped I/O:
        * A simpler and more convenient way to interface I/O devices
        * Does not need any special instructions
        * Each device register is assigned to a memory address space
        * Uses native CPU load/store instructions: *LDR/STR Reg, [Reg, #imm]*
        * If we write to the special memory location assigned to a device register (*STR*), the written data is sent to the corresponding I/O device

# MMIO