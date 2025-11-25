`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2025 10:25:52 AM
// Design Name: 
// Module Name: RAM6116System
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

module RAM6116System (
    input clk, rst_n,
    input start_i,
    output reg done_o
);
    localparam S0 = 0;
    localparam S1 = 1;
    localparam S2 = 2;
    localparam S3 = 3;
    reg [2-1 : 0] state, n_state;

    reg we_n, oe_n;

    reg [`WLEN-1 : 0] data; // data register
    reg [`WLEN-1 : 0] MAR; // memory address register
    wire [`WLEN-1 : 0] address; // memory address register
    wire [`WLEN-1 : 0] IO; // data bus

    SRAM6116 u1 (
        .clk(clk), .rst_n(rst_n),
        .cs_ni(1'b0), .we_ni(we_n), .oe_ni(oe_n),
        .address(address),
        .IO(IO)
    );

    // state
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) state <= S0;
        else state <= n_state;
    end

    always @* begin
        case (state)
            S0: n_state = S1;
            S1: n_state = S2;
            S2: n_state = S3;
            S3: n_state = (address == 32)? S3 : S0;
        endcase
    end

    // data
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) data <= 0;
        else begin
            case (state)
                S0: data <= IO; // load data from the data bus to the data register
                S2: data <= data + 1; // increment data register
            endcase
        end
    end

    // MAR
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) MAR <= 0;
        else begin
            case (state)
                S2: MAR <= MAR + 1;
            endcase
        end
    end

    assign address = MAR;

    // oe_n
    always @* begin
        oe_n = 1;

        case (state)
            S0: oe_n = 0;
        endcase
    end

    // we_n
    always @* begin
        we_n = 1;

        case (state)
            S2: we_n = 0;
        endcase
    end

    // done_o
    always @* begin
        done_o = 0;

        case (state)
            S3: if (address == 32) done_o = 1;
        endcase
    end
endmodule
