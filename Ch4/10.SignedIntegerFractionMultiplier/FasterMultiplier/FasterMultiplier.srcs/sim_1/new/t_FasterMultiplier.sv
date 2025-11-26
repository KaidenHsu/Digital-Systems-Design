`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 11:51:39 PM
// Design Name: 
// Module Name: t_FasterMultiplier
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
`define TEST_CASES 11

module t_FasterMultiplier;
    logic clk, rst_n;
    logic start;
    logic [4-1 : 0] A, B;
    logic [8-1 : 0] product;
    logic done;
    
    logic signed [4-1 : 0] Mcandarr [0:`TEST_CASES-1];
    logic signed [4-1 : 0] Mplierarr [0:`TEST_CASES-1];
    logic signed [7-1 : 0] Productarr [0:`TEST_CASES-1];

    FasterMultiplier uut (
        .clk(clk), .rst_n(rst_n),
        .start_i(start),
        .A_i(A), .B_i(B),
        .product_o(product),
        .done_o(done)
    );

    // --- SystemVerilog Assertions (SVA) ---
    // Check reset clears outputs
    property p_reset_clears;
        @(posedge clk) (!rst_n) |-> (product == 0 && done == 0);
    endproperty
    assert property (p_reset_clears) else $error("SVA failed: reset did not clear product/done");

    // Done should correspond to internal state == 5
    property p_done_state;
        @(posedge clk) done |-> (uut.state == 3'd5);
    endproperty
    assert property (p_done_state) else $error("SVA failed: done asserted when state != 5");

    // State should remain in valid range (0..6)
    property p_state_range;
        @(posedge clk) (uut.state <= 3'd6);
    endproperty
    assert property (p_state_range) else $error("SVA failed: state out of range");

    // When start is asserted, done should occur within 6 clock cycles
    property p_start_eventual_done;
        @(posedge clk) start |-> ##[1:6] done;
    endproperty
    assert property (p_start_eventual_done) else $error("SVA failed: start did not lead to done within 6 cycles");


    initial begin
        clk = 0;
        forever #(`CLK_CYCLE/2) clk = ~clk;
    end

    initial begin
        Mcandarr[0] = 4'b0111;
        Mcandarr[1] = 4'b1101;
        Mcandarr[2] = 4'b0101;
        Mcandarr[3] = 4'b1101;
        Mcandarr[4] = 4'b0111;
        Mcandarr[5] = 4'b1000;
        Mcandarr[6] = 4'b0111;
        Mcandarr[7] = 4'b1000;
        Mcandarr[8] = 4'b0000;
        Mcandarr[9] = 4'b1111;
        Mcandarr[10] = 4'b1011;

        Mplierarr[0] = 4'b0101;
        Mplierarr[1] = 4'b0101;
        Mplierarr[2] = 4'b1101;
        Mplierarr[3] = 4'b1101;
        Mplierarr[4] = 4'b0111;
        Mplierarr[5] = 4'b0111;
        Mplierarr[6] = 4'b1000;
        Mplierarr[7] = 4'b1000;
        Mplierarr[8] = 4'b1101;
        Mplierarr[9] = 4'b1111;
        Mplierarr[10] = 4'b0000;

        Productarr[0] = 7'b0100011;
        Productarr[1] = 7'b1110001;
        Productarr[2] = 7'b1110001;
        Productarr[3] = 7'b0001001;
        Productarr[4] = 7'b0110001;
        Productarr[5] = 7'b1001000;
        Productarr[6] = 7'b1001000;
        Productarr[7] = 7'b1000000;
        Productarr[8] = 7'b0000000;
        Productarr[9] = 7'b0000001;
        Productarr[10] = 7'b0000000;
    end

    int i;

    initial begin
        {start, A, B} = '0;
        rst_n = 1;

        force clk = 0;
        #(2*`CLK_CYCLE);
        rst_n = 0;
        #(2*`CLK_CYCLE);
        rst_n = 1;
        #(2*`CLK_CYCLE);
        release clk;

        @(posedge clk);

        for (i = 0; i < `TEST_CASES; i++) begin
            @(negedge clk);
            start = 1;
            A = Mcandarr[i];
            B = Mplierarr[i];

            @(negedge clk);
            start = 0;
            A = 0;
            B = 0;

            @(posedge done);
            if (product !== Productarr[i]) begin
                $display("Wrong Answer! %d(%b) x %d(%b) != %d(%b)", Mcandarr[i], Mcandarr[i], Mplierarr[i], Mplierarr[i], product, product);
                #10 $finish;
            end
        end

        $display("All test cases passed!");
        #10 $finish;
    end
endmodule
