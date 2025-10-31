module TrafficLightController (
    input Sa_i, Sb_i,
    input clk,
    output Ga_o, Ya_o, Ra_o, Gb_o, Yb_o, Rb_o
);
    localparam S0 = 0;
    localparam S1 = 1;
    localparam S2 = 2;
    localparam S3 = 3;
    localparam S4 = 4;
    localparam S5 = 5;
    localparam S6 = 6;
    localparam S7 = 7;
    localparam S8 = 8;
    localparam S9 = 9;
    localparam S10 = 10;
    localparam S11 = 11;
    localparam S12 = 12;
    localparam S13 = 13;
    localparam S14 = 14;
    localparam S15 = 15;

    reg [4-1 : 0] state, next_state;
endmodule
