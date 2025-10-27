module FullAdder (
    input [4-1 : 0] a, b,
    input cin,
    output [5-1 : 0] s
);
    assign s = a + b + cin;
endmodule
