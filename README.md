# 16-bit ALU with Fault Injection and ATPG Simulation (Gate-Level Verilog)
This project demonstrates a *16-bit Arithmetic Logic Unit (ALU)* written in *strict gate-level Verilog, enhanced with a **fault injection mechanism* and an *Automatic Test Pattern Generation (ATPG)* testbench. It simulates realistic DFT scenarios for identifying stuck-at faults.
## Overview
This Verilog project implements:
- A *strict gate-level modeled 16-bit ALU* using only logic gates (and, or, xor, not).
- A *fault injection wrapper* to simulate *stuck-at-0 (SA0)* and *stuck-at-1 (SA1)* faults on input lines of the ALU.
- An *ATPG-style testbench* that:
  - Applies random and deterministic test vectors,
  - Injects faults bit-wise,
  - Compares outputs of golden vs faulty ALU,
  - Logs which faults are detected.
  ## Modules
### 1. 16-bit Gate-Level ALU
- Performs AND, OR, XOR, and ADD operations.
- Built entirely with logic gates using generate and genvar for structural modeling.
- Input: A, B, ALU_Sel
- Output: Result, Cout
### 2. ATPG-Style Testbench
- Simulates patterns like:
  - No fault,
  - Single-bit SA0 / SA1 for each input bit of A,
  - Random vectors.
- Checks:
  - If faulty output ≠ golden output → fault is detected.
  - Displays detected faults with details.
- Uses assert, $display, $fatal for visibility.
## Fault Model
- *Stuck-At Faults* only on input A[15:0]
- Two types:
  - *Stuck-at-0 (SA0)*: A bit is forced to 0
  - *Stuck-at-1 (SA1)*: A bit is forced to 1
## Code for Fault injection 
- assign a_faulty[i] = (fault_mask_a[i]) ? fault_value_a[i] : a[i]
