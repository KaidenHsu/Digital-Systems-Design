# Digital Systems Design 數位系統設計

## Ch1. Review of Logic Design Fundamentals
1. Combinational Logic
2. Boolean Algebra and Algebraic Simplification
3. K-map
    - [Simplification Using Map-Entered Variables (MEVs)][1.3]
4. Designing with NAND and NOR Gates
5. [Hazards in Combinational Circuits][1.5]
6. FFs and Latches
7. Mealy Sequential Circuit Design
8. Design a Moore Sequential Circuit
9. Equivalent States and Reduction of State Tables
10. [Sequential Circuit Timing][1.10]

[1.3]: Ch1/1.03K-MapsAndMEVs.pdf
[1.5]: Ch1/1.05HazardsInCombCkts.pdf
[1.10]: Ch1/1.10SeqCktTiming.pdf

## Ch2. Introduction to Verilog
1. Computer-Aided Designs (CAD)
2. Hardware Description Languages (HDLs)
3. Verilog Description of Combinational Circuits
4. Verilog Modules
5. Continuous Assignments
6. Procedural Assignments
7. Modeling FFs Using Always Blocks
8. Always Blocks Using Event Control Statements
9. [Delays in Verilog][2.9]
10. Compilation, Simulation, and Synthesis of Verilog Code
11. Verilog Datatypes and Operators
12. Simple Synthesis Examples
13. Verilog Models for Mulitiplexers
14. Modeling Registers and Counters Using Verilog Always Statements
15. Behavioral and Structural Verilog
16. Constants
17. Arrays
18. Loops in Verilog
19. Testing a Verilog Model (Testbench)
20. [A Few Things to Remember][2.20]

[2.9]: Ch2/2.09Delays.pdf
[2.20]: Ch2/2.20VerilogTips.pdf

## Ch3. Introduction to Programmable Logic Devices
1. [Brief Overview of Programmable Logic Devices (PLDs)][3.1]
    - Read-only memories (ROMs)
    - Programmable Logic Arrays (PLAs)
    - Programmable Array Logic (PAL)
    - Generic Array Logic (GAL)
2. [Simple Programmable Logic Devices (SPLDs)][3.2]
3. [Complex Programmable Logic Devices (CPLDs)][3.3]
4. [Field-Programmable Gate Arrays (FPGAs)][3.4]

[3.1]: Ch3/3.01PLDsOverview.pdf
[3.2]: Ch3/3.02SPLDs.pdf
[3.3]: Ch3/3.03CPLDs.pdf
[3.4]: Ch3/3.04FPGAs.pdf

## Ch4. Design Examples
1. [BCD to 7-Segment Display Decoder (comb)][4.1]
2. [BCD Adder (comb)][4.2]
3. [32-Bit Adders (comb, seq)][4.3]
4. [Traffic Light Controller (seq)][4.4]
5. [State Graphs for Control Circuits][4.5]
6. [Scoreboard and Controller (seq)][4.6]
7. [Synchronization and Debouncing (seq)][4.7]
8. [Shift-and-Add Multiplier (seq)][4.8]
9. Array Multiplier (comb)
10. Signed Integer/Fraction Multiplier (seq)
11. Keypad Scanner (seq)
12. Binary Dividers (seq)

[4.1]: Ch4/01.BCDTo7Seg/
[4.2]: Ch4/02.BCDAdder/
[4.3]: Ch4/03.32BitCLA/
[4.4]: Ch4/04.TrafficLightController/
[4.5]: Ch4/05.StateGraphsForControlCircuits/
[4.6]: Ch4/06.ScoreboardAndController/
[4.7]: Ch4/07.SynchronizationAndDebouncing/
[4.8]: Ch4/08.ShiftAddMultiplier/

## Ch5. State Machine Charts and Microprogramming
0. [Introduction][5.0]
1. [State Machine Charts (SM Charts)][5.1]
2. [Derivation of SM Charts][5.2]
    - [Binary Multiplier Controller][5.2.1]
    - [Dice-Game][5.2.2]
3. [Realization of SM Charts (Hardwiring)][5.3]
4. [Implementation of Dice Game (Hardwiring)][5.4]
5. [Microprogramming][5.5]
6. [Linked State Machines][5.6]

[5.0]: Ch5/5.00Introduction.pdf
[5.1]: Ch5/5.01StateMachineCharts.pdf
[5.2]: Ch5/5.02DerivationOfSMCharts.pdf
[5.2.1]: Ch5/5.02/BinaryMultiplierController/
[5.2.2]: Ch5/5.02/DiceGame/
[5.3]: Ch5/5.03RealizationOfSMChart.pdf
[5.4]: Ch5/5.04ImplementationOfDiceGame.pdf
[5.5]: Ch5/5.05Microprogramming.pdf
[5.6]: Ch5/5.06LinkedStateMachines.pdf

## Ch7. Floating-point Arithmetic
1. [Representation of Floating-point Numbers][7.1]
2. Floating-point Multiplication
3. Floating-point Addition
4. Other Floating-point Operations: Subtraction and Division

[7.1]: Ch7/7.01RepresentationOfFLPNumbers.pdf