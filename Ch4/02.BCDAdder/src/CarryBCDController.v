module CarryBCDController (
    input [5-1 : 0] sum,
    output [4-1 : 0] bcd,
    output carry
);
    assign carry = (sum > 9)? 1 : 0;
    // A ~ F are not meaningful in BCD
    assign bcd = (sum > 9)? sum+6 : sum;
endmodule
