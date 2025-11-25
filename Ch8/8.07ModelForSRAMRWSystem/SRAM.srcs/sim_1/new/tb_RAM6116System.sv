`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2025 10:26:35 AM
// Design Name: 
// Module Name: tb_RAM6116System
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


`define CLK_CYCLE 10

module tb_RAM6116System;
    logic clk, rst_n;
    logic start;
    logic done;

    RAM6116System uut (
        .clk(clk), .rst_n(rst_n),
        .start_i(start),
        .done_o(done)
    );

    initial begin
        clk = 0;
        forever #(`CLK_CYCLE/2) clk = ~clk;
    end

    logic valid;

    initial begin
        start = 0;

        force clk = 0;
        rst_n = 1;
        #(2*`CLK_CYCLE);
        rst_n = 0;
        #(2*`CLK_CYCLE);
        rst_n = 1;
        release clk;

        @(posedge clk);
        @(negedge clk);
        // demonstrate the read-modify-write cycle: pulse `start` for one clock
        start = 1;
        @(negedge clk);
        start = 0;

        // wait for operation to finish
        @(done);
        #10 $finish;
    end

    // -- SystemVerilog Assertions (SVA) --
    // Check that after `start` is pulsed, `done` is asserted within a timeout window
    property p_done_within_timeout;
        // disable when reset is active-low
        @(posedge clk) disable iff (!rst_n) (start ##1 (!start) |-> ##[0:100] done);
    endproperty

    // Immediate assertion: fail the simulation if property is violated
    assert property (p_done_within_timeout)
        else $error("Assertion FAILED: `done` did not assert within 100 cycles after `start` pulse");

    // Coverage: observe at least one successful completion
    property p_done_covered;
        @(posedge clk) disable iff (!rst_n) (start ##1 (!start) |-> ##[0:100] done);
    endproperty

    cover property (p_done_covered);
endmodule
