`timescale 1ns/1ns
module Tester;
    reg clk, rst_n;
    wire Rb, Reset;
    wire roll, win, lose;
    wire [4-1 : 0] sum;
    wire done;

    DiceGame uut1 (
        .sum_i(sum), .Rb_i(Rb), .Reset_i(Reset),
        .clk(clk), .rst_n(rst_n),
        .roll_o(roll), .win_o(win), .lose_o(lose)
    );

    GameTest uut2 (
        .roll_i(roll), .win_i(win), .lose_i(lose),
        .clk(clk), .rst_n(rst_n),
        .sum_o(sum), .Rb_o(Rb), .Reset_o(Reset),
        .done(done)
    );

    initial begin
        $dumpfile("DiceGame.vcd");
        $dumpvars;
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        force clk = 0;
        rst_n = 1;
        #2 rst_n = 0;
        #8 rst_n = 1;
        release clk;
    end

    always @* begin
        if (done) #10 $finish;
    end
endmodule
