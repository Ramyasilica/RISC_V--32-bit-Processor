# RISC_V--32-bit-Processor

 🌍 Welcome World!

Welcome to my **fourth GitHub repository** 🎉
This project presents a **RISC-V 32-bit processor core** implemented using **Verilog HDL** and verified through **behavioral simulation using Vivado**.

This repository is created to **learn, implement, and understand processor design concepts** at the RTL level by building and simulating a simple **RISC-V RV32 processor core** from scratch.

📌 What is RISC-V?

**RISC-V** (Reduced Instruction Set Computer – Five) is an open-source instruction set architecture (ISA) designed to be **simple, modular, and extensible**.

Key characteristics of RISC-V:
* Open-source and royalty-free ISA
* Clean and simple instruction formats
* Easy to implement in hardware
* Widely used in **academics, research, and industry**

This project is based on:
* **RISC-V 32-bit base architecture (RV32)**

## Project Overview

In this repository, **I have implemented a basic RISC-V 32-bit processor core using Verilog HDL** to understand how a processor works internally.

The project focuses on:

* Instruction fetch using a **Program Counter (PC)**
* Fetching 32-bit instructions from instruction memory
* Decoding instructions according to RISC-V ISA
* Executing basic instructions
* Reading from and writing to general-purpose registers

The processor is designed to execute instructions **cycle by cycle**, and its correctness is verified through **simulation waveform analysis** using Vivado.

This implementation serves as a **foundation-level RISC-V core**, suitable for learning and future extensions such as pipelining, memory interfaces, and peripherals.


## Processor Architecture (High Level)

The RISC-V processor core consists of the following major blocks:

* **Program Counter (PC)**
  Maintains the address of the current instruction and updates sequentially.

* **Instruction Register**
  Holds the fetched 32-bit instruction.

* **Register File**
  Contains 32 general-purpose registers (`x0` to `x31`), each 32 bits wide.

* **Control Logic**
  Decodes instructions and controls data flow and execution.

* **ALU (Arithmetic Logic Unit)**
  Performs arithmetic and logical operations required by instructions.

## RISC-V Registers

RISC-V defines **32 general-purpose registers**, each 32 bits wide:

* `x0` → Hardwired to constant zero
* `x1 – x31` → General-purpose registers

In this simulation, the following registers are observed and updated:

* `x1`
* `x2`
* `x3`
* `x4`

Register updates visible in the waveform confirm correct instruction execution

## Processor Signals (From Waveform)

## Observed Signals

* `clk` – System clock driving the processor
* `reset` – Initializes processor state
* `pc[31:0]` – Program Counter
* `instr[31:0]` – Fetched instruction
* `x1[31:0]` – Register x1
* `x2[31:0]` – Register x2
* `x3[31:0]` – Register x3
* `x4[31:0]` – Register x4

These signals help verify instruction flow and register behavior.


##  Working of the Processor

The processor operates as follows:

1. **Clock starts toggling**
2. **Reset initializes the processor**
3. Program Counter (`pc`) fetches the instruction
4. Instruction (`instr`) is loaded and decoded
5. Execution logic performs the required operation
6. Destination register is updated
7. Program Counter moves to the next instruction
8. The process repeats for subsequent instructions


 📊 Simulation Results (Waveform Analysis)

From the simulation waveform:

* Clock (`clk`) runs continuously
* Reset is deasserted, enabling execution
* Program Counter updates correctly
* Instruction fetched is:


instr = 0x00000013

## Instruction Decode

0x00000013 → ADDI x0, x0, 0


This instruction corresponds to a **NOP (No Operation)** in RISC-V.

## Register Values Observed

* `x1 = 0x0000000A`
* `x2 = 0x00000014`
* `x3 = 0x0000001E`
* `x4 = 0x0000000A`

✅ Registers update correctly
✅ Instruction execution is valid

This confirms correct **instruction fetch, decode, and execution behavior**.

## 🖼️ Output Waveform

*Add the Vivado simulation waveform here to demonstrate PC updates, instruction execution, and register activity.*

🧾 Conclusion

This repository demonstrates a **working RISC-V 32-bit processor core** implemented using Verilog HDL.
Simulation results confirm correct clock operation, instruction execution, and register updates, making this project a strong base for further enhancements like pipelining, memory integration, and peripheral interfacing.


## Thank you for visiting!

This is my **fourth GitHub repository**, and more advanced RTL projects will be added soon 🚀
Feel free to explore, learn, and suggest improvements.

