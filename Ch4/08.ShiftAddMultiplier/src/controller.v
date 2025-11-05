module controller (
    input K_i, M_i, 
    input clk, st,
    output reg load_o, sh_o, ad_o, done_o
);
    localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    reg [2-1 : 0] state, next_state;

    // state
    always @(posedge clk) begin
        state <= next_state;
    end

    always @* begin
        case (state)
            S0: next_state = (St)? S1 : S0;
            S1: begin
                if (M) begin
                    next_state = S2;
                end else begin
                    next_state = (K)? S3 : S1;
                end
            end
            S2: next_state = (K)? S3 : S1;
            S3: next_state = S0;
        endcase
    end

    // load_o
    always @(posedge clk) begin
        load_o <= 0;

        case (state)
            S0: if (St) load_o <= 1;
        endcase
    end

    // sh_o
    always @(posedge clk) begin
        sh_o <= 0;

        case (state)
            S1: if (!M) sh_o <= 1;
            S2: sh_o <= 1;
        endcase
    end

    // ad_o
    always @(posedge clk) begin
        ad_o <= 0;

        case (state)
            S1: if (M) ad_o <= 1;
        endcase
    end

    // done_o
    always @(posedge clk) begin
        done_o <= 0;

        case (state)
            S3: done_o <= 1;
        endcase
    end
endmodule
