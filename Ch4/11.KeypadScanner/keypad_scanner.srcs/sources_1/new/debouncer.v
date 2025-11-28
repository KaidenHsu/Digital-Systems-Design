`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2025 05:51:03 PM
// Design Name: 
// Module Name: debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncer(
    input clk, rst_n,
    input K_i,
    output Kd_o
);
    reg QA, QB;

    // double flip flops
    always @(posedge clk, negedge rst_n) begin
        QA <= K_i;
        QB <= QA;
    end

    // Kd_o
    assign Kd_o = QA & ~QB;
endmodule
