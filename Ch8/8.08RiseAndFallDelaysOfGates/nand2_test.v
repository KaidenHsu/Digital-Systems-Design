module NAND2_test (
    input in1,
    input in2,
    input in3,
    input in4,
    output out1,
    output out2
);
    // parameter map, can also use defparam
    NAND2 #(2, 1, 2) U1 (in1, in2, out1);

    NAND2 U2 (in3, in4, out2);
endmodule