`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2025 10:25:14 AM
// Design Name: 
// Module Name: SRAM6116
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


`define WLEN 8
`define MLEN 256

module SRAM6116 (
    input clk, rst_n,
    input cs_ni, we_ni, oe_ni, // chip select, write enable, output enable
    input [`WLEN-1 : 0] address,
    inout [`WLEN-1 : 0] IO // we choose bidirectional IO for SRAM for smaller package size
);
    reg [`WLEN-1 : 0] RAM [0 : `MLEN-1]; // 256x8 RAM

    // RAM
    integer i;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < `MLEN; i=i+1) begin
                RAM[i] <= 0;
            end
        end else if (!cs_ni && !we_ni) RAM[address] <= IO; // sync write to RAM
    end
    
    // IO
    assign IO = (cs_ni || !we_ni || oe_ni)? 8'bZZZZ_ZZZZ : RAM[address]; // async read from RAM
endmodule
