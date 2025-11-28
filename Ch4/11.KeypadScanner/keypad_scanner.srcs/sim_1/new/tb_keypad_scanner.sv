`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2025 08:35:27 PM
// Design Name: 
// Module Name: tb_keypad_scanner
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
`define TEST_CASES 24

module tb_keypad_scanner();
    logic clk, rst_n;
    logic [4-1 : 0] R;
    logic [4-1 : 0] N;
    logic [3-1 : 0] C;
    logic V;

    int KARRAY[0 : `TEST_CASES-1]; // key array, test cases
    int KN; // key now, current test case

    keypad_scanner_top uut (
        .clk(clk), .rst_n(rst_n),
        .R_i(R),
        .N_o(N),
        .C_o(C),
        .V_o(V)
    );


    // initialize test cases
    initial begin
        KARRAY[0] = 2;
        KARRAY[1] = 5;
        KARRAY[2] = 8;
        KARRAY[3] = 0;
        KARRAY[4] = 3;
        KARRAY[5] = 6;
        KARRAY[6] = 9;
        KARRAY[7] = 11;
        KARRAY[8] = 1;
        KARRAY[9] = 4;
        KARRAY[10] = 7;
        KARRAY[11] = 10;
        KARRAY[12] = 1;
        KARRAY[13] = 2;
        KARRAY[14] = 3;
        KARRAY[15] = 4;
        KARRAY[16] = 5;
        KARRAY[17] = 6;
        KARRAY[18] = 7;
        KARRAY[19] = 8;
        KARRAY[20] = 9;
        KARRAY[21] = 10;
        KARRAY[22] = 11;
        KARRAY[23] = 0;
    end

    // simulate keypad behavior
    assign R[0] = (C[0] & KN == 1) | (C[1] & KN == 2) | (C[2] & KN == 3);
    assign R[1] = (C[0] & KN == 4) | (C[1] & KN == 5) | (C[2] & KN == 6);
    assign R[2] = (C[0] & KN == 7) | (C[1] & KN == 8) | (C[2] & KN == 9);
    assign R[3] = (C[0] & KN == 10) | (C[1] & KN == 0) | (C[2] & KN == 11);

    initial begin
        clk = 0;
        forever #(`CLK_CYCLE/2) clk = ~clk;
    end

    int i;

    initial begin
        R = 0;
        KN = 12;

        force clk = 0;
        rst_n = 1;
        #(2*`CLK_CYCLE);
        rst_n = 0;
        #(2*`CLK_CYCLE);
        rst_n = 1;
        #(2*`CLK_CYCLE);
        release clk;

        @(posedge clk);
        @(posedge clk);

        for (i = 0; i < `TEST_CASES; i++) begin
            @(negedge clk);
            KN = KARRAY[i];
            $display("[%t] test case %d: %d", $time, i, KARRAY[i]);

            @(posedge V);
            if (N !== KN) begin
                $display("[%t] Numbers don't match! %d(%b) != %d(%b)", $time, N, N, KN, KN);
                #(`CLK_CYCLE) $finish;
            end

            @(posedge clk);
            KN = 12;
            repeat (5) @(posedge clk);
        end

        $display("All test cases passed!");
        #(`CLK_CYCLE) $finish;
    end
endmodule
