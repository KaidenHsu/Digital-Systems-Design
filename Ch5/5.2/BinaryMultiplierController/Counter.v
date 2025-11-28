module Counter (
    input sh_i, load_i,
    input clk, rst_n, st,
    output reg K_o
);
    // Q: 0 ~ 3
    reg [2-1 : 0] Q;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) Q <= 0;
        else if (load_i) Q <= 0;
        else if (sh_i) Q <= Q + 1;
    end

    // K_o
    always @* begin
        K_o = 0;

        if (Q == 3 && sh_i) K_o = 1;
    end
endmodule
