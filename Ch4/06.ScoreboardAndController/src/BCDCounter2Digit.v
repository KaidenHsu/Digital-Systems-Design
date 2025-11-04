module BCDCounter2Digit (
    input inc_i, dec_i, erase_i,
    input clk,
    output reg [4-1 : 0] tens_o, units_o
);
    reg [4-1 : 0] tens, units;

    // units, units_o
    always @(posedge clk) begin
        if (erase_i) begin
            units <= 0;
            units_o <= 0;
        end else begin
            if (inc_i) begin
                units <= (units == 9)? 0 : units + 1;
                units_o <= (units == 9)? 0 : units + 1;
            end

            if (dec_i) begin
                units <= (units == 0)? 9 : units - 1;
                units_o <= (units == 0)? 9 : units - 1;
            end
        end
    end

    // tens, tens_o
    always @(posedge clk) begin
        if (erase_i) begin
            tens <= 0;
            tens_o <= 0;
        end else begin
            if (inc_i && units == 9) begin
                tens <= (tens == 9)? 0 : tens + 1;
                tens_o <= (tens == 9)? 0 : tens + 1;
            end

            if (dec_i && units == 0) begin
                tens <= (tens == 0)? 9 : tens - 1;
                tens_o <= (tens == 0)? 9 : tens - 1;
            end
        end
    end
endmodule
