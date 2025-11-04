module Scoreboard (
    input inc_i, dec_i, erase_i,
    input clk, rst,
    output [7 : 1] tens_7seg_o, units_7seg_o
);
    wire [4-1 : 0] tens, units;

    BCDCounter2Digit u1 (
        .inc_i(inc), .dec_i(dec), .erase_i(erase),
        .clk(clk),
        .tens_o(tens), .units_o(units)
    );

    BCDTo7SegDecoder u2 (
        .bcd(tens),
        .seven(tens_7seg_o)
    );

    BCDTo7SegDecoder u3 (
        .bcd(units),
        .seven(units_7seg_o)
    );

    wire inc, dec, erase;

    Controller u4 (
        .inc_i(inc_i), .dec_i(dec_i), .erase_i(erase_i),
        .clk(clk), .rst(rst),
        .inc_o(inc), .dec_o(dec), .erase_o(erase)
    );
endmodule
