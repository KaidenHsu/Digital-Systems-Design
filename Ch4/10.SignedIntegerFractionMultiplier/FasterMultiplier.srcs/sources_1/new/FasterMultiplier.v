`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 08:11:34 PM
// Design Name: 
// Module Name: FasterMultiplier
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


module FasterMultiplier(
    input clk, rst_n,
    input start_i,
    input [4-1 : 0] A_i, B_i,
    output [7-1 : 0] product_o,
    output done_o
);
    reg [3-1 : 0] state;

    reg [4-1 : 0] B;

    reg [8-1 : 0] acc;

    // B
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) B <= 0;
        else if (start_i) B <= B_i;
    end

    // state
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) state <= 0;
        else begin
            state <= state + 1;

            case (state)
                0: state <= 0;
                6: state <= 6;
            endcase

            if (start_i) state <= 1;
        end
    end

    // acc
    wire [4-1 : 0] B_comp = ~B + 1; // 2's complement

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) acc <= 0;
        else if (start_i) acc <= {4'b0, A_i};
        else begin
            if (acc[0]) begin
                if (state == 4) begin
                    acc[7] <= B_comp[3];
                    acc[6:3] <= acc[7:4] + B_comp;
                    acc[2:0] <= acc[3:1];
                end else begin
                    acc[7] <= B[3];
                    acc[6:3] <= acc[7:4] + B;
                    acc[2:0] <= acc[3:1];
                end
            end else acc <= {acc[7], acc[7:1]};
        end
    end

    assign product_o = acc[6:0];

    assign done_o = (state == 5)? 1 : 0;
endmodule
