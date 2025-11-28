`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2025 07:08:14 PM
// Design Name: 
// Module Name: keypad_scanner_top
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


module keypad_scanner_top(
    input clk, rst_n,
    input [4-1 : 0] R_i,
    output [4-1 : 0] N_o,
    output [3-1 : 0] C_o,
    output V_o
);
    wire [3-1 : 0] C;
    assign C_o = C;

    wire K = |R_i;
    wire Kd;

    scanner u1 (
        .clk(clk), .rst_n(rst_n),
        .K_i(K), .Kd_i(Kd),
        .R_i(R_i),
        .C_o(C),
        .N_o(N_o),
        .V_o(V_o)
    );

    debouncer u2 (
        .clk(clk), .rst_n(rst_n),
        .K_i(K),
        .Kd_o(Kd)
    );

    decoder u3 (
        .R_i(R_i),
        .C_i(C),
        .N_o(N_o)
    );
endmodule
