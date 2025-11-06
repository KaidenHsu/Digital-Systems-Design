// 8-bit unsigned shift-add multiplier
module Datapath (
    input load_i, sh_i, ad_i,
    input [4-1 : 0] mplier_i, mcand_i,
    input clk, rst_n,
    output M_o,
    output [8-1 : 0] product_o
);
    // acc
    reg [9-1 : 0] acc;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) acc <= 0;
        else begin
            if (load_i) acc <= {5'b0, mplier_i};
            if (sh_i) acc <= acc >> 1;
            if (ad_i) acc <= acc + {mcand_i, 4'b0};
        end
    end

    // M_o
    assign M_o = acc[0];

    // product_o
    assign product_o = acc[7:0];
endmodule
