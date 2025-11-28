module DiceGame (
    input [4-1 : 0] sum_i,
    input Rb_i, Reset_i,
    input clk, rst_n,
    output reg roll_o, win_o, lose_o
);
    // test logic
    reg D7, D711, D2312;

    always @* begin
        D7 = 0;
        D711 = 0;
        D2312 = 0;

        if (sum_i == 7) D7 = 1;
        if ((sum_i == 7) || (sum_i == 11)) D711 = 1;
        if ((sum_i == 2) | (sum_i == 3) | (sum_i == 12)) D2312 = 1;
    end

    // point
    reg [4-1 : 0] point;
    reg Sp;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) point <= 2;
        else if (Sp) point <= sum_i;
    end

    // win_o
    always @* begin
        win_o = 0;

        case (state)
            S2: win_o = 1;
        endcase
    end

    // lose_o
    always @* begin
        lose_o = 0;

        case (state)
            S3: lose_o = 1;
        endcase
    end

    // controller
    localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;
    reg [3-1 : 0] state, next_state;

    always @(posedge clk, negedge rst_n) begin
        state <= (!rst_n)? 0 : next_state;
    end

    always @* begin
        case (state)
            S0: next_state = (Rb_i)? S1 : S0;
            S1: begin
                if (Rb_i) next_state = S1;
                else if (D711) next_state = S2;
                else if (D2312) next_state = S3;
                else next_state = S4;
            end
            S2: next_state = (Reset_i)? S0 : S2;
            S3: next_state = (Reset_i)? S0 : S3;
            S4: next_state = (Rb_i)? S5: S4;
            S5: begin
                if (Rb_i) next_state = S5;
                else if (sum_i == point) next_state = S2;
                else if (D7) next_state = S3;
                else next_state = S4;
            end
        endcase
    end

    // Sp
    always @* begin
        Sp = 0;

        case (state)
            S1: if (!Rb_i && !D711 && !D2312) Sp = 1;
        endcase
    end

    // roll_o
    always @* begin
        roll_o = 0;

        case (state)
            S1, S5: if (Rb_i) roll_o = 1;
        endcase
    end
endmodule
