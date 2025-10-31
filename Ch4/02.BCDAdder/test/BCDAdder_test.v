module t_BCDAdder;
    reg [8-1 : 0] a, b;
    wire [9-1 : 0] ans;

    BCDAdder uut (
        .a(a), .b(b),
        .ans(ans)
    );

    initial begin
        $dumpfile("BCDAdder.vcd");
        $dumpvars;
    end

    // file handles
    integer fa, fb, fc;

    // correct sum
    reg [9-1 : 0] golden;            if (ans !== golden) begin
                $display("a=%d, b=%d, ans=%d, golden=%d", a, b, ans, golden);
                #20 $finish;
            end

    integer status;


    initial begin
        fa = $fopen("../test_cases/a.txt", "r");
        fb = $fopen("../test_cases/b.txt", "r");
        fc = $fopen("../test_cases/c.txt", "r");

        while (!$feof(fa)) begin
            #10
            status = $fscanf(fa, "%b\n", a);
            status = $fscanf(fb, "%b\n", b);
            status = $fscanf(fc, "%b\n", golden);

            #10

            // $display("a=%b, b=%b, ans=%b, golden=%b", a, b, ans, golden);

            if (ans !== golden) begin
                $display("a=%d, b=%d, ans=%d, golden=%d", a, b, ans, golden);
                #20 $finish;
            end
        end

        $display("All test cases passed!");

        $fclose(fa);
        $fclose(fb);
        $fclose(fc);

        $finish;
    end
endmodule
