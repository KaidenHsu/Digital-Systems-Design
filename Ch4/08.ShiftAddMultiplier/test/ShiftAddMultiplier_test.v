`timescale 1ns/1ps
module t_ShiftAddMultiplier;
    reg [4-1 : 0] mcand, mplier;
    reg clk, st, rst_n;
    wire [8-1 : 0] product;
    wire done;

    ShiftAddMultiplier uut (
        .mcand_i(mcand), .mplier_i(mplier),
        .clk(clk), .st(st), .rst_n(rst_n),
        .product_o(product),
        .done(done)
    );

    initial begin
        $dumpfile("ShiftAddMultiplier.vcd");
        $dumpvars;
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        st = 0;
        mcand = 7;
        mplier = 11;

        // reset the circuit
        rst_n = 1;
        force clk = 0;
        #2 rst_n = 0;
        #8 release clk;
        @(posedge clk);
        #2 rst_n = 1;

        // start calculating
        #2 st = 1;
        @(posedge clk);
        #2 st = 0;

        // wait for 10 cycles
        repeat(8) @(posedge clk);

        #10 $finish;
    end
endmodule
