module GameTest (
    input roll_i, win_i, lose_i,
    input clk, rst_n,
    output reg [4-1 : 0] sum_o,
    output reg Rb_o, Reset_o,
    output reg done
);
    // state
    localparam T0 = 0, T1 = 1, T2 = 2, T3 = 3;
    reg [2-1 : 0] Tstate, Tnext;

    parameter N = 12; // #(simulated dice rolls)

    always @(posedge clk, negedge rst_n) begin
        Tstate <= (!rst_n)? 0 : Tnext;
    end

    always @* begin
        Tnext = T0;

        case (Tstate)
            T0: begin
                if (i >= N) Tnext = T3;
                else if (roll_i) Tnext = T1;
                else Tnext = T0;
            end
            T1: Tnext = T2;
            T2: Tnext = T0;
        endcase
    end

    // Rb_o
    always @* begin
        Rb_o = 0;

        case (Tstate)
            T0: Rb_o = 1;
        endcase
    end

    // Reset_o
    always @* begin
        Reset_o = 0;

        case (Tstate)
            T2: if (win_i || lose_i) Reset_o = 1;
        endcase
    end

    // done
    always @* begin
        done = 0;

        case (Tstate)
            T3: done = 1;
        endcase
    end

    // sumarray
    reg [4-1 : 0] sumarray [0 : 12-1];

    always @(negedge rst_n) begin
        sumarray[0] = 7;
        sumarray[1] = 11;
        sumarray[2] = 2;
        sumarray[3] = 4;
        sumarray[4] = 7;
        sumarray[5] = 5;
        sumarray[6] = 6;
        sumarray[7] = 7;
        sumarray[8] = 6;
        sumarray[9] = 8;
        sumarray[10] = 9;
        sumarray[11] = 6;
    end

    // sum_o, i
    reg [4-1 : 0] i;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            sum_o <= 0;
            i <= 0;
        end else begin
            case (Tstate)
                T0: begin
                    if (i < N && roll_i) begin
                        sum_o <= sumarray[i];
                        i <= i + 1;
                    end
                end
            endcase
        end
    end

    // Trig1
    reg Trig1;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) Trig1 <= 0;
        else begin
            case (Tstate)
                T2: Trig1 <= ~Trig1;
            endcase
        end
    end
endmodule
