module BCDAdder (
    input [8-1 : 0] a, b,
    output [9-1 : 0] ans
);

    wire lower_carry, upper_carry;

    wire [5-1 : 0] s0, s1;

    wire [4-1 : 0] lower_ans, upper_ans;
    
    FullAdder lower_adder (
        .a(a[3:0]), .b(b[3:0]),
        .cin(1'b0), .s(s0)
    );

    FullAdder upper_adder (
        .a(a[7:4]), .b(b[7:4]),
        .cin(lower_carry), .s(s1)
    );

    CarryBCDController lower_controller (
        .sum(s0),
        .bcd(lower_ans),
        .carry(lower_carry)
    );

    CarryBCDController upper_controller (
        .sum(s1),
        .bcd(upper_ans),
        .carry(upper_carry)
    );

    assign ans = {upper_carry, upper_ans, lower_ans};
endmodule
