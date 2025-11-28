`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2025 08:00:29 PM
// Design Name: 
// Module Name: decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: a combinational decoder circuit
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder(
    input [4-1 : 0] R_i,
    input [3-1 : 0] C_i,
    output [4-1 : 0] N_o
);
    // N_o
    assign N_o[3] = (R_i[2] & ~C_i[0]) | (R_i[3] & ~C_i[1]);
    assign N_o[2] = R_i[1] | (R_i[2] & C_i[0]);
    assign N_o[1] = (R_i[0] & ~C_i[0]) | (~R_i[2] & C_i[2]) | (~R_i[1] & ~R_i[0] & C_i[0]);
    assign N_o[0] = (R_i[1] & C_i[1]) | (~R_i[1] & C_i[2]) | (~R_i[3] & ~R_i[1] & ~C_i[1]);
endmodule
