module Controller (
    input M_i,
    input clk, rst_n, st,
    output load_o, sh_o,
    output reg ad_o,
    output reg done
);
    localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    reg [2-1 : 0] state, next_state;

    // state
    always @(posedge clk, negedge rst_n) begin
        state <= (!rst_n)? S0 : next_state;
    end

    always @* begin
        case (state)
            S0: next_state = (st)? S1 : S0;
            S1: begin
                if (M_i) next_state = S2;
                else next_state = (K)? S3 : S1;
            end
            S2: next_state = (K)? S3 : S1;
            S3: next_state = S0;
        endcase
    end

    // load_o
    reg load;

    always @* begin
        load = 0;

        case (state)
            S0: if (st) load = 1;
        endcase
    end

    assign load_o = load;

    // sh, sh_o
    reg sh;

    always @* begin
        sh = 0;

        case (state)
            S1: if (!M_i) sh = 1;
            S2: sh = 1;
        endcase
    end

    assign sh_o = sh;

    // ad_o
    always @* begin
        ad_o = 0;

        case (state)
            S1: if (M_i) ad_o = 1;
        endcase
    end

    // done
    always @* begin
        done = 0;

        case (state)
            S3: done = 1;
        endcase
    end

    Counter u1 (
        .sh_i(sh), .load_i(load),
        .clk(clk), .st(st), .rst_n(rst_n),
        .K_o(K)
    );
endmodule
