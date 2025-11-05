module BCDCounter2Digit (
    input inc_i, dec_i, erase_i,
    input clk,
    output reg [4-1 : 0] tens_o, units_o
);
    // units_o
    always @* begin
        if (erase_i) begin
            units_o = 0;
        end else begin
            if (inc_i) units_o = (units == 9)? 0 : units + 1;
            if (dec_i) units_o = (units == 0)? 9 : units - 1;
        end
    end

    // tens_o
    always @* begin
        if (erase_i) begin
            tens_o = 0;
        end else begin
            if (inc_i && units == 9) tens_o = (tens == 9)? 0 : tens + 1;
            if (dec_i && units == 0) tens_o = (tens == 0)? 9 : tens - 1;
        end
    end

    reg [4-1 : 0] tens, units;

    // units
    always @(posedge clk) begin
        if (erase_i) begin
            units <= 0;
        end else begin
            if (inc_i) units <= (units == 9)? 0 : units + 1;
            if (dec_i) units <= (units == 0)? 9 : units - 1;
        end
    end

    // tens
    always @(posedge clk) begin
        if (erase_i) begin
            tens <= 0;
        end else begin
            if (inc_i && units == 9) tens <= (tens == 9)? 0 : tens + 1;
            if (dec_i && units == 0) tens <= (tens == 0)? 9 : tens - 1;
        end
    end
endmodule
