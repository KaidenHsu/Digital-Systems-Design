module Controller (
    input inc_i, dec_i, erase_i,
    input clk, rst,
    output reg inc_o, dec_o, erase_o
);
    localparam CLR = 0;
    localparam CNT = 1;

    reg state, next_state;
    reg [3-1 : 0] erasecnt;

    // erasecnt
    always @(posedge clk) begin
        case (state)
            CLR: erasecnt <= 0;
            CNT: erasecnt <= (erase_i && erasecnt != 4)? erasecnt+1 : 0;
        endcase
    end

    // erase
    always @(posedge clk) begin
        case (state)
            CLR: erase_o <= 0;
            CNT: erase_o <= (erase_i && erasecnt == 4)? 1 : 0;
        endcase
    end

    // inc 
    always @(posedge clk) begin
        case (state)
            CLR: inc_o <= 0;
            CNT: inc_o <= (inc_i && !dec_i)? 1 : 0;
        endcase
    end
    
    // dec
    always @(posedge clk) begin
        case (state)
            CLR: dec_o <= 0;
            CNT: dec_o <= (!inc_i && dec_i)? 1 : 0;
        endcase
    end

    // FSM
    always @(posedge clk) begin
        state <= (rst)? CLR: next_state;
    end

    always @* begin
        case (state)
            CLR: begin
                next_state = (erase_i)? CLR : CNT;
            end
            CNT: begin
                next_state = (erase_i && erasecnt == 4)? CLR : CNT;
            end
        endcase
    end
endmodule
