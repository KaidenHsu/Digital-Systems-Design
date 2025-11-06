`timescale 1ns/1ps
module t_SinglePulser;
    reg syncpress;
    reg clk, rst;
    wire SP;

    SinglePulser uut (
        .syncpress_i(syncpress),
        .clk(clk), .rst(rst),
        .SP_o(SP)
    );

    initial begin
        $dumpfile("SinglePulser.vcd");
        $dumpvars;
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 0;
        #2 rst = 1;
        @(posedge clk);
        #2 rst = 0;

        syncpress = 0;
        @(posedge clk)
        syncpress = 1;
        repeat(3) @(posedge clk);

        syncpress = 0;
        @(posedge clk)
        syncpress = 1;
        repeat(4) @(posedge clk);

        syncpress = 0;
        #10 $finish;
    end
endmodule
