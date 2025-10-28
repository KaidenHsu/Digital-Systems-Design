module CLA16 (
    input [16-1 : 0] a, b,
    input cin,
    output [16-1 : 0] s,
    output cout
);
    wire [4-1 : 0] gg, pg; // group propagate, group generate

    wire c4, c8, c12;

    CLA4 adder4_3 (
        .a(a[15:12]), .b(b[15:12]),
        .c0(c12),
        .s(s[15:12]),
        .c4(),
        .gg(gg[3]),
        .pg(pg[3])
    );

    CLA4 adder4_2 (
        .a(a[11:8]), .b(b[11:8]),
        .c0(c8),
        .s(s[11:8]),
        .c4(),
        .gg(gg[2]),
        .pg(pg[2])
    );

    CLA4 adder4_1 (
        .a(a[7:4]), .b(b[7:4]),
        .c0(c4),
        .s(s[7:4]),
        .c4(),
        .gg(gg[1]),
        .pg(pg[1])
    );

    CLA4 adder4_0 (
        .a(a[3:0]), .b(b[3:0]),
        .c0(cin),
        .s(s[3:0]),
        .c4(),
        .gg(gg[0]),
        .pg(pg[0])
    );
    
    // controller
    assign c4 = gg[0] | (pg[0] & cin);
    assign c8 = gg[1] | (pg[1] & gg[0]) | (pg[1] & pg[1] & pg[0] & cin);
    assign c12 = gg[2] | (pg[2] & gg[1]) | (pg[2] & pg[1] & gg[0]) | (pg[2] & pg[1] & pg[0] & cin);
    assign cout = gg[3] | (pg[3] & gg[2]) | (pg[3] & pg[2] & gg[1]) | (pg[3] & pg[2] & pg[1] & gg[0]) | (pg[3] & pg[2] & pg[1] & pg[0] & cin);
endmodule
