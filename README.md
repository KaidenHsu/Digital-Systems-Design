# Digital Systems Design 數位系統設計

這是一門由陽明交通大學 (NYCU) 開設的，數位系統導論（Introduction to Digital Systems）的進階課程。課程內容兼顧理論與實務，其中第四與第七章共提供了 16 個 design example。課程從單純的數位系統理論，逐步培養學生正確的設計觀念。我這堂課使用 AMD Xilinx Zedboard FPGA 作為實作平台，從撰寫 RTL、在 Vivado 中進行模擬 (simulation) 與除錯 (debug, ILA)，到最後實際上板 (configuration)，完整走過一次 FPGA 設計流程，熟悉 FPGA 開發環境。
<br>
<br>
理論部分，第一章作為複習章節，回顧數位系統導論（Introduction to Digital Systems）中的核心觀念，並進一步引入 hazard、timing 等在實際設計中關鍵的議題。第二章與第八章介紹 Verilog 語法，雖然此前已具備 Verilog 基礎，但我仍藉此機會檢視並修正自己的 coding style 是否良好，以避免合成出的硬體與想像中不同的狀況。第三章介紹 PLD (Programmable Logic Device) 的分類與發展，從 ROM、PAL、PLA、GLA、CPLD ，到本課程所使用的 FPGA 平台。第五章接著介紹了除了常見 FSM 外的其他設計方法，包括 state machine charts 與 microprogramming。章節最後介紹 linked state machine ，以利往後設計複雜系統的控制器。第六章則深入說明 FPGA 的內部運作原理，以及相關 EDA tool 的基本概念，讓我對 FPGA 在硬體層面是如何被實現，與其使用有了更具體的理解。
<br>
<br>
其中第四章與第七章為實作章節。第四章由淺入深提供了 12 個 design example，介紹各種組合 (combinational) 電路與循序 (sequential) 電路的設計方式。第七章則結合當今 AI 世代的背景，介紹浮點數 (floating-point) 加減乘除等運算單元的硬體設計，讓我理解這些數值運算在硬體中實際是如何被實作的。
<br>
<br>
上完這堂課後，我對數位設計的理解更加完整，也為日後進一步的硬體設計與系統開發打下了扎實基礎。在撰寫 RTL 時，我不再只是停留在語法，而是能聯想到實際合成 (synthesize) 後的硬體結構。同時，對於課程中涉及的多項數位設計理論，也都有了深刻的體會。

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
