module SinglePulser (
    input syncpress_i,
    input clk, rst,
    output reg SP_o
);
    localparam S0 = 0, S1 = 1;
    reg state, next_state;

    // state
    always @(posedge clk) begin
        state <= (rst)? S0 : next_state;
    end

    always @* begin
        case (state)
            S0: next_state = (syncpress_i)? S1 : S0;
            S1: next_state = (syncpress_i)? S1 : S0;
        endcase
    end

    // SP_o
    always @* begin
        case (state)
            S0: SP_o = (syncpress_i)? 1 : 0;
            S1: SP_o = 0;
        endcase
    end
endmodule
