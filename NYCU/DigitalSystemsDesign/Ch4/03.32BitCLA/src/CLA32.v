module CLA32 (
    input [32-1 : 0] a, b,
    output [33-1 : 0] s
);
    wire carry;

    CLA16 lower (
        .a(a[15:0]), .b(b[15:0]),
        .cin(1'b0),
        .s(s[15:0]),
        .cout(carry)
    );
    
    CLA16 upper (
        .a(a[31:16]), .b(b[31:16]),
        .cin(carry),
        .s(s[31:16]),
        .cout(s[32])
    );
endmodule
