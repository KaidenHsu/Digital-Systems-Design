module NAND2 (
    input a,
    input b,
    output reg c
);
    parameter Trise = 3;
    parameter Tfall = 2;
    parameter load = 1;

    wire nand_value = ~(a & b);

    always @(nand_value) begin
        if (nand_value) #(Trise+3*load) c <= 1;
        else #(Trise+2*load) c <= 0;
    end
endmodule
