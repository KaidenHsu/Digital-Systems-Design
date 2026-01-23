`define NULL 0
`define EOF 32'hffff_ffff

module file_read;
    integer file, ret;
    reg [32-1 : 0] r_w, addr, data;

    initial begin: file_read
        // open file
        file = $fopen("data", r);

        // guard statement
        if (file == `NULL) disable file_read;

        // main loop
        while (!$feof(file)) begin
            // read a formatted line
            ret = $fscanf(file, "%s %h %h\n", r_w, addr, data);

            // display based on command
            case (r_w)
                "rd": $display("READ mem[%h] => %h", addr, data);
                "wr": $display("WRITE mem[%h] <= %h", addr, data);
                default: $display("Unknown command '%s'", r_w);
            endcase

            // close file
            ret = $fclose(file);
        end
    end
endmodule
