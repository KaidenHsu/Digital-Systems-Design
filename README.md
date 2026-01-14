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

## Chapters

 Chapters   | Descriptions
--------|:-----
[Ch1][1]|Review of Logic Design Fundamentals
[Ch2][2]|Introduction to Verilog
[Ch3][3]|Introduction to Programmable Logic Devices
[Ch4][4]|Design Examples
[Ch5][5]|State Machine Charts and Microprogramming
[Ch6][6]|Designing with FPGAs
[Ch7][7]|Floating-point Arithmetic
[Ch8][8]|Additional Topics in Verilog

[1]: Ch1/
[2]: Ch2/
[3]: Ch3/
[4]: Ch4/
[5]: Ch5/
[6]: Ch6/
[7]: Ch7/
[8]: Ch8/
