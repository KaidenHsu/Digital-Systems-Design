module Controller (
    input inc_i, dec_i, erase_i,
    input clk, rst,
    output reg inc_o, dec_o, erase_o
);
    localparam CLR = 0, CNT = 1;
    reg state, next_state;

    // 1. outputs
    // erase_o
    always @* begin
        erase_o = 0;

        case (state)
            CNT: if (erase_i && erasecnt == 4) erase_o = 1;
        endcase
    end

    // inc_o
    always @* begin
        inc_o = 0;

        case (state)
            CNT: if (inc_i && !dec_i) inc_o = 1;
        endcase
    end
    
    // dec_o
    always @* begin
        dec_o = 0;

        case (state)
            CNT: if (!inc_i && dec_i) dec_o = 1;
        endcase
    end

    // 2. FSM
    always @(posedge clk) begin
        state <= (rst)? CLR: next_state;
    end

    always @* begin
        case (state)
            CLR: next_state = (erase_i)? CLR : CNT;
            CNT: next_state = (erase_i && erasecnt == 4)? CLR : CNT;
        endcase
    end

    // 3. counter
    reg [3-1 : 0] erasecnt;

    // erasecnt
    always @(posedge clk) begin
        case (state)
            CNT: if (erase_i && erasecnt != 4) erasecnt <= erasecnt+1;
            CLR: erasecnt <= 0;
        endcase
    end
endmodule
