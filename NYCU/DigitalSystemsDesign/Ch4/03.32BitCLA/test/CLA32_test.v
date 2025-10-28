module t_CLA32;
    reg [32-1 : 0] a, b;
    wire [33-1 : 0] s;

    CLA32 uut (
        .a(a), .b(b),
        .s(s)
    );

    reg [32-1 : 0] i, j;
    reg [33-1 : 0] golden;

    initial begin
        $dumpfile("CLA32.vcd");
        $dumpvars;
    end

    integer seed = 5;

    initial begin
        repeat (100) begin
            a = $urandom(seed)%(2**32-1);
            b = $urandom(seed)%(2**32-1);

            // $display("%d, %d", a, b);

            golden = a + b;

            #10
            if (s !== golden) begin
                $display("a=%d, b=%d, ans=%b, golden=%d", a, b, s, golden);
                #10 $finish;
            end
        end

        $display("All test cases passed!");
        #10 $finish;
    end
endmodule
