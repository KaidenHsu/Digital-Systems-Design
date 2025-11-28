`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2025 04:09:27 PM
// Design Name: 
// Module Name: scanner
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


module scanner(
    input clk, rst_n,
    input K_i, Kd_i,
    input [4-1 : 0] R_i,
    output reg [3-1 : 0] C_o,
    output [4-1 : 0] N_o,
    output reg V_o // valid
);
    reg [3-1 : 0] state, n_state;

    // state
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) state <= 0;
        else state <= n_state;
    end

    always @* begin
        case (state)
            0: n_state = 1;
            1: n_state = (K_i && Kd_i)? 2 : 1;
            2: n_state = 3;
            3, 4: begin
                if (!K_i) n_state = state + 1;
                else if (K_i && !Kd_i) n_state = state;
                else n_state = 6;
            end
            5: n_state = (K_i && Kd_i)? 6 : 5;
            6: n_state = (!Kd_i)? 1 : 6;
        endcase
    end

    // C_o
    always @* begin
        case (state)
            0: C_o = 3'b000;
            1: C_o = 3'b111;
            2: C_o = 3'b000;
            3: C_o = 3'b001;
            4: C_o = 3'b010;
            5: C_o = 3'b100;
            6: C_o = 3'b111;
        endcase
    end

    // V_o
    always @* begin
        V_o = 0;

        case (state)
            3, 4, 5: if (K_i && Kd_i) V_o = 1;
        endcase
    end
endmodule
