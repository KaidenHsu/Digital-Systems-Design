module TrafficLightController (
    input Sa_i, Sb_i,
    input clk, rst_n,
    output reg Ga_o, Ya_o, Ra_o, Gb_o, Yb_o, Rb_o
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

    // two-process machine for FSM
    always @(posedge clk) begin
        if (!rst_n) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    always @* begin
        // default assignment to avoid latches
        next_state = state;
        {Ga_o, Ya_o, Ra_o, Gb_o, Yb_o, Rb_o} = 0;

        case (state)
            S0, S1, S2, S3, S4: begin
                next_state = state + 1;
                Ga_o = 1;
                Rb_o = 1;
            end
            S5: begin
                next_state = (Sb_i)? S6 : S5;
                Ga_o = 1;
                Rb_o = 1;
            end
            S6: begin
                next_state = S7;
                Ya_o = 1;
                Rb_o = 1;
            end
            S7, S8, S9, S10: begin
                next_state = state + 1;
                Ra_o = 1;
                Gb_o = 1;
            end
            S11: begin
                next_state = (~Sa_i & Sb_i)? S11 : S12;
                Ra_o = 1;
                Yb_o = 1;
            end
            S12: begin
                next_state = S0;
                Ra_o = 1;
                Yb_o = 1;
            end
            S13, S14, S15: begin
                next_state = S0;
            end
        endcase
    end
endmodule

