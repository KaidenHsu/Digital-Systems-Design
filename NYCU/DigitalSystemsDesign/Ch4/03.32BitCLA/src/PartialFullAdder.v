module PartialFullAdder (
    input a, b,
    input cin,
    output s,
    output p, g
);
    assign s = a ^ b ^ cin; // sum

    assign p = a ^ b; // carry propogate
    assign g = a & b; // carry generate
endmodule
