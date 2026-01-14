# Digital Systems Design 數位系統設計

這是一門由陽明交通大學 (NYCU) 開設的，數位系統導論（Introduction to Digital Systems）的進階課程。內容不只停留在概念層次，而是同時兼顧理論與實務。課程為數位設計建立了相當扎實的理論基礎，其中第四與第七章共提供了 16 個 design example，帶我實際認識完整的數位設計流程，從單純的數位系統理論，逐步建立正確的設計觀念，培養數位設計厚實基礎。此外，我使用 AMD Xilinx Zedboard FPGA 作為實作平台，從撰寫 RTL、在 Vivado 中進行模擬 (simulation) 與除錯 (debug, ILA)，到最後實際上板 (configuration)，完整走過一次硬體設計流程，對 FPGA 開發環境也變得相當熟悉。
<br>
<br>
在理論部分，第一章作為複習章節，回顧了數位系統導論（Introduction to Digital Systems）中的核心觀念，並進一步引入 hazard、timing 等在實際設計中非常關鍵的議題。第二章與第八章介紹 Verilog 語法與建模方式，雖然此前已具備 Verilog 基礎，但仍藉此檢視並修正自己的 coding style，確保撰寫方式更貼近良好的設計實務。第三章則系統性介紹了 PLD 的分類與發展脈絡，從 ROM、PAL、PLA、GLA、CPLD 到 FPGA，各自的特性與適用情境都有清楚說明，也自然銜接到本課程所使用的 FPGA 平台。第五章介紹了除了常見 FSM 之外的其他設計方法，包括 state machine charts 與 microprogramming。章節最後說明在複雜系統中常見的控制器設計技巧，如 linked state machine。第六章則深入說明 FPGA 的內部運作原理，以及相關 EDA tool 的基本概念，讓我對 FPGA 這顆「萬用晶片」在硬體層面是如何被實現與使用，有了更具體的理解。
<br>
<br>
在設計導向的章節中，第四章與第七章特別令人印象深刻。第四章的設計範例由淺入深，循序介紹各種組合 (combinational) 電路與循序 (sequential) 電路的設計方式，幫助我將抽象概念轉化為可實作的硬體結構；第七章則結合當今 AI 世代的背景，介紹浮點數 (floating-point) 加減乘除等運算單元的硬體設計，讓我理解這些看似抽象的數值運算，在硬體中實際是如何被拆解與實作的，也加深了我對效能與硬體成本之間取捨的認識。
<br>
<br>
整體而言，上完這堂課後，我對數位設計的理解更加完整，也為日後進一步的硬體設計與系統開發打下了扎實基礎。在撰寫 RTL 時，我不再只是停留在語法層面，而能聯想到實際合成 (sythesize) 後的硬體結構；同時，對於課程中涉及的多項數位設計理論，也都有了更深刻且實用的體會。

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
[5.2]: Ch5/5.2/5.02DerivationOfSMCharts.pdf
[5.2.1]: Ch5/5.2/BinaryMultiplierController/
[5.2.2]: Ch5/5.2/DiceGame/
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