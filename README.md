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
10. [Compilation, Simulation, and Synthesis of Verilog Code][2.10]
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
[2.10]: Ch2/2.10CompilationSimulationAndSynthesis.pdf
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
9. [Array Multiplier (comb)][4.9]
10. [Signed Integer/Fraction Multiplier (seq)][4.10]
    - [Faster Multiplier][4.10.1]
    - [Booth's Multiplier][4.10.2]
11. [Keypad Scanner (seq)][4.11]
12. Binary Dividers (seq)

[4.1]: Ch4/01.BCDTo7Seg/
[4.2]: Ch4/02.BCDAdder/
[4.3]: Ch4/03.32BitCLA/
[4.4]: Ch4/04.TrafficLightController/
[4.5]: Ch4/05.StateGraphsForControlCircuits/
[4.6]: Ch4/06.ScoreboardAndController/
[4.7]: Ch4/07.SynchronizationAndDebouncing/
[4.8]: Ch4/08.ShiftAddMultiplier/
[4.9]: Ch4/09.ArrayMultiplier/
[4.10]: Ch4/10.SignedIntegerFractionMultiplier/4.10SignedIntegerFractionMultiplier.pdf
[4.10.1]: Ch4/10.SignedIntegerFractionMultiplier/FasterMultiplier/
[4.10.2]: Ch4/10.SignedIntegerFractionMultiplier/BoothsMultiplier/
[4.11]: Ch4/11.KeypadScanner/

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

## Ch6. Designing with FPGAs

1. [Implementing Functions with FPGAs][6.1]
2. Implementing Functions using Shannon's Decomposition
3. Carry Chains in FPGAs
4. Cascade Chains in FPGAs
5. Examples of Logic Blocks in Commercial FPGAs
6. Dedicated Memory in FPGAs
7. Dedicated Multipliers in FPGAs
8. Cost of Programmability
9. FPGAs and One-hot State Assignment
10. FPGA Capacity: Maximum Gates vs Usable Gates
11. Design Translation (Synthesis)
12. Mapping, Placement, and Routing

[6.1]: Ch6/6.01ImplementingFunctionsInFPGAs.pdf

## Ch7. Floating-point Arithmetic

1. [Representation of Floating-point Numbers][7.1]
2. [Floating-point Multiplication][7.2]
    - [Floating-point Multiplier][7.2.1]
3. Floating-point Addition
4. Other Floating-point Operations: Subtraction and Division

[7.1]: Ch7/7.01RepresentationOfFLPNumbers.pdf
[7.2]: Ch7/7.02FLPMultiplication.pdf
[7.2.1]: Ch7/7.02.1FLPMultplier.pdf

## Ch8. Additional Topics in Verilog

1. Verilog Functions
2. Verilog Tasks
3. [Multivalued Logic and Signal Resolution][8.3]
4. [Built-in Primitives][8.4]
5. [User-defined Primitives][8.5]
6. [SRAM Model][8.6]
7. [Model for SRAM Read/Write System][8.7]
8. Rise and Fall Delays of Gates
9. Named Association
10. Generate Statements
11. System Functions
12. Compiler Directives
13. File I/O Functions
14. Timing Checks

[8.3]: Ch8/8.03MultivaluedLogicAndSignalResolution.pdf
[8.4]: Ch8/8.04BuiltinPrimitives.pdf
[8.5]: Ch8/8.05UserDefinedPrimitives.pdf
[8.6]: Ch8/8.06SRAMModel/
[8.7]: Ch8/8.07ModelForSRAMRWSystem/