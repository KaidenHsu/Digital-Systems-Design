`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 10:51:33 PM
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


`define CLK_CYCLE 10

module FasterMultiplier;
    logic clk, rst_n;
    logic start;
    logic [4-1 : 0] A, B;
    logic [8-1 : 0] product;
    logic done;

    FasterMultiplier uut (
        .clk(clk), .rst_n(rst_n),
        .start_i(start),
        .A_i(A), .B_i(B),
        .product_o(product),
        .done(done)
    );

    initial begin
        clk = 0;
        forever #(`CLK_CYCLE/2) clk = ~clk;
    end

    int i, j;

    initial begin
        {start, A, B} = 0;
        rst_n = 1;

        force clk = 0;
        #(2*CLK_CYCLE);
        rst_n = 0;
        #(2*CLK_CYCLE);
        rst_n = 1;
        #(2*CLK_CYCLE);
        release clk;

        @(posedge clk);

        for (i = 0; i < 5; i++) begin
            for (j = 0; j < 5; j++) begin
                @(negedge clk);
                A = i;
                B = j;

                @(negedge clk);
                A = 0;
                B = 0;

                @(done);
                if (i * j !== product) begin
                    $display("Wrong Answer! %d(%b) x %d(%b) != %d(%b)", i, i, j, j, product, product);
                    #10 $finish;
                end
            end
        end

        $display("All test cases passed! average cycle = %d", total_cycle/25);
        #10 $finish;
    end
endmodule
