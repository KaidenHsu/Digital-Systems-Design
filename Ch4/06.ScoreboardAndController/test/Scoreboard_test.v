module t_Scoreboard;
    task delay (
        input [10:0] cycles
    );
        repeat (cycles) begin
            @(posedge clk);
        end
    endtask

    // erase the scoreboard
    task erase_scoreboard();
        begin
            delay(2);
            erase = 0;
            #2 erase = 1;
            delay(6);
            #2 erase = 0;
        end
    endtask

    reg inc, dec, erase;
    reg clk, rst;
    wire [7 : 1] tens_7seg, units_7seg;

    Scoreboard uut (
        .inc_i(inc), .dec_i(dec), .erase_i(erase),
        .clk(clk), .rst(rst),
        .tens_7seg_o(tens_7seg), .units_7seg_o(units_7seg)
    );

    initial begin
        $dumpfile("Scoreboard.vcd");
        $dumpvars;
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // initialization
        inc = 0;
        dec = 0;
        erase = 0;

        // start the machine
        rst = 0;
        #2 rst = 1;
        @(posedge clk);
        #2 rst = 0;
        
        erase_scoreboard();

        // increment score
        delay(2);
        #2 inc = 1;
        @(posedge clk);
        #2 inc = 0;

        // decrement score
        delay(2);
        #2 dec = 1;
        @(posedge clk);
        #2 dec = 0;

        erase_scoreboard();

        // finish simulation
        delay(2);
        $finish;
    end
endmodule
