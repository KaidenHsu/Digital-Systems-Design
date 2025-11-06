module ShiftAddMultiplier (
    input [4-1 : 0] mcand_i, mplier_i,
    input clk, st, rst_n,
    output [8-1 : 0] product_o,
    output done
);
    wire K, M, load, sh, ad;

    Controller u1 (
        .M_i(M),
        .clk(clk), .st(st), .rst_n(rst_n),
        .load_o(load), .sh_o(sh), .ad_o(ad),
        .done(done)
    );

    Datapath u3 (
        .load_i(load), .sh_i(sh), .ad_i(ad), .mplier_i(mplier_i), .mcand_i(mcand_i),
        .clk(clk), .rst_n(rst_n),
        .M_o(M), .product_o(product_o)
    );
endmodule
