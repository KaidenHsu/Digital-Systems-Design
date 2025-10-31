module CLA4 (
    input [4-1 : 0] a, b,
    input c0, // carry in
    output [4-1 : 0] s, // sum
    output c4, // carry out
    output gg, pg // group propagate, group generate
);
    wire [3 : 1] c; // c3 ~ c1
    wire [4-1 : 0] p, g; // carry propagate, carry generate

    PartialFullAdder pfa_0 (
        .a(a[0]), .b(b[0]),
        .cin(c0),
        .s(s[0]),
        .p(p[0]), .g(g[0])
    );

    PartialFullAdder pfa_1 (
        .a(a[1]), .b(b[1]),
        .cin(c[1]),
        .s(s[1]),
        .p(p[1]), .g(g[1])
    );

    PartialFullAdder pfa_2 (
        .a(a[2]), .b(b[2]),
        .cin(c[2]),
        .s(s[2]),
        .p(p[2]), .g(g[2])
    );

    PartialFullAdder pfa_3 (
        .a(a[3]), .b(b[3]),
        .cin(c[3]),
        .s(s[3]),
        .p(p[3]), .g(g[3])
    );

    // controller
    assign c[1] = g[0] | (p[0] & c0);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);
    assign c4 = g[3] | (p[3] & c[3]);

    assign gg = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]); // group generate
    assign pg = &p; // group propagate
endmodule
