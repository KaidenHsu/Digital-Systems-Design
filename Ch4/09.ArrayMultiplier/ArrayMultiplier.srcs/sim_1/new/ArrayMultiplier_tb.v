`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 07:59:17 AM
// Design Name: 
// Module Name: ArrayMultiplier_tb
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


module ArrayMultiplier_tb;
    reg [4-1 : 0] X_i, Y_i;
    wire [8-1 : 0] P_o;

    ArrayMultiplier uut (
        .X_i(X_i), .Y_i(Y_i),
        .P_o(P_o)
    );

    initial begin
        $dumpfile("ArrayMultiplier.vcd");
        $dumpvars;
    end

    reg [4-1 : 0] i, j;
    initial begin
        for (i = 0; i < 5; i=i+1) begin
            for (j = 0; j < 5; j=j+1) begin
                X_i = i;
                Y_i = j;

                #10
                if (P_o !== i*j) begin
                    $display("Wrong Answer! %d (%b) x %d (%b) != %d (%b)", i, i, j, j, P_o, P_o);
                    #10 $finish;
                end
            end
        end

        $display("All test cases passed!");
        #10 $finish;
    end
endmodule
