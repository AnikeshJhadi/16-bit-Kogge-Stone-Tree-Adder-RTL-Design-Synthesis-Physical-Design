# 16-bit Registered Kogge-Stone Tree Adder | RTL Design, Synthesis & Physical Design

This repository contains the implementation of a **16-bit Registered Kogge-Stone Tree Adder (KSA)** developed as part of the **EE671: VLSI Design** course at the **Department of Electrical Engineering, IIT Bombay**. The project covers the complete ASIC design flow, including RTL design, functional verification, logic synthesis, physical design, and post-layout verification using industry-standard EDA tools.

---

## Project Overview

The objective of this project is to design, verify, and physically implement a **16-bit registered Kogge-Stone Tree Adder**, a high-performance parallel-prefix adder widely used in modern processors due to its logarithmic carry propagation delay.

The design registers both the inputs and outputs, making it suitable for pipelined digital systems. Functional correctness is verified through simulation before and after synthesis, followed by ASIC implementation using Cadence Innovus. 

---

## Repository Structure

```
.
├── rtl/
│   └── kogge_stone_16bit.v
│
├── testbench/
│   └── kogge_stone_16bit_TB.v
│
├── netlist/
│   └── post_synthesis_rtl_netlist.v
│
├── reports/
│   ├── GROUP_61_ASSIGNMENT_3_REPORT.pdf
│   └── GROUP_61_EE671_ASSIGNMENT_4_REPORT.pdf
│
│
└── README.md
```

---

## Design Flow

The complete ASIC design flow followed in this project is:

```
RTL Design (Verilog HDL)
        │
        ▼
Functional Simulation
        │
        ▼
Logic Synthesis (Cadence Genus)
        │
        ▼
Gate-Level Netlist Generation
        │
        ▼
Physical Design (Cadence Innovus)
        │
        ▼
Floorplanning
        │
        ▼
Placement
        │
        ▼
Clock Tree Synthesis (CTS)
        │
        ▼
Routing
        │
        ▼
Timing, Area & Power Analysis
        │
        ▼
Post-Layout Simulation
```

---

## Repository Contents

### `kogge_stone_16bit.v`

RTL implementation of the 16-bit registered Kogge-Stone Tree Adder using parallel-prefix carry computation with registered inputs and outputs.

### `kogge_stone_16bit_TB.v`

Comprehensive Verilog testbench used for functional verification through multiple test vectors and corner-case testing.

### `post_synthesis_rtl_netlist.v`

Gate-level RTL netlist generated after logic synthesis using **Cadence Genus**.

### Assignment Reports

- RTL Design, Functional Verification and Synthesis Report
- Physical Design, Timing, Area, Power and Post-Layout Verification Report

---

## Features

- 16-bit Registered Kogge-Stone Tree Adder
- Parallel Prefix Carry Computation
- Registered Inputs & Outputs
- Verilog HDL Implementation
- Functional RTL Verification
- Post-Synthesis Gate-Level Verification
- Cadence Genus Logic Synthesis
- Cadence Innovus Physical Design
- Timing, Area and Power Analysis
- Post-Layout Simulation

---

## Tools Used

- Verilog HDL
- Cadence Genus
- Cadence Innovus
- Cadence Incisive Simulator
- GTKWave

---

## Physical Design Results

The backend implementation includes:

- Floorplanning
- Power Planning
- Placement
- Clock Tree Synthesis (CTS)
- Routing
- RC Extraction
- Timing Closure
- Physical Verification

The final implementation achieved:

- ✅ Zero DRC Violations
- ✅ Zero Antenna Violations
- ✅ Correct Connectivity
- ✅ Successful Post-Layout Verification

Key post-route metrics:

| Metric | Value |
|---------|------:|
| Target Frequency | 100 MHz |
| Worst Setup Slack | 0.003 ns |
| Worst Hold Slack | 0.050 ns |
| Total Area | 665.28 μm² |
| Total Power | 1.042 μW |


## Author

**Anikesh Jhadi**  
M.Tech. Electronic Systems (EE5)  
Department of Electrical Engineering  
Indian Institute of Technology Bombay

---
