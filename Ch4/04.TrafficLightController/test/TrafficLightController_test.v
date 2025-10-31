module t_TrafficLightController;
    reg Sa, Sb;
    reg clk, rst_n;
    wire Ga, Ya, Ra, Gb, Yb, Rb;

    TrafficLightController uut (
        .Sa_i(Sa), .Sb_i(Sb),
        .clk(clk), .rst_n(rst_n),
        .Ga_o(Ga), .Ya_o(Ya), .Ra_o(Ra), .Gb_o(Gb), .Yb_o(Yb), .Rb_o(Rb)
    );

    initial begin
        $dumpfile("TrafficLightController.vcd");
        $dumpvars;
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Reset the circuit
        rst_n = 1;
        #5 rst_n = 0;
        // @(posedge clk);
        #5 rst_n = 1;
        Sa = 0;
        Sb = 0;

        // A car is approaching on street B
        #80 Sb = 1;

        // A car is approaching on street A
        #70 Sa = 1;

        #20 $finish;
    end
endmodule
