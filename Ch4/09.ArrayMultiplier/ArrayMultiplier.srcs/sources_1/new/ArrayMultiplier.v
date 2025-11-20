module ArrayMultiplier (
    input [4-1 : 0] X_i, Y_i,
    output [8-1 : 0] P_o
);
    reg [4-1 : 0] XY [4-1 : 0];
    wire [4-1 : 0] S1, S2, S3;
    wire [4-1 : 0] C1, C2, C3;

    // XY
    integer i, j;
    always @* begin
        for (i = 0; i < 4; i=i+1) begin
            for (j = 0; j < 4; j=j+1) begin
                XY[i][j] = X_i[j] & Y_i[i];
            end
        end
    end

    // full adders and half adders
    FullAdder FA1 (XY[0][2], XY[1][1], C1[0], C1[1], S1[1]);
    FullAdder FA2 (XY[0][3], XY[1][2], C1[1], C1[2], S1[2]);
    FullAdder FA3 (S1[2], XY[2][1], C2[0], C2[1], S2[1]);
    FullAdder FA4 (S1[3], XY[2][2], C2[1], C2[2], S2[2]);
    FullAdder FA5 (C1[3], XY[2][3], C2[2], C2[3], S2[3]);
    FullAdder FA6 (S2[2], XY[3][1], C3[0], C3[1], S3[1]);
    FullAdder FA7 (S2[3], XY[3][2], C3[1], C3[2], S3[2]);
    FullAdder FA8 (C2[3], XY[3][3], C3[2], C3[3], S3[3]);

    HalfAdder HA1 (XY[0][1], XY[1][0], C1[0], S1[0]);
    HalfAdder HA2 (XY[1][3], C1[2], C1[3], S1[3]);
    HalfAdder HA3 (S1[1], XY[2][0], C2[0], S2[0]);
    HalfAdder HA4 (S2[1], XY[3][0], C3[0], S3[0]);

    // P_o
    assign P_o[0] = XY[0][0];
    assign P_o[1] = S1[0];
    assign P_o[2] = S2[0];
    assign P_o[3] = S3[0];
    assign P_o[4] = S3[1];
    assign P_o[5] = S3[2];
    assign P_o[6] = S3[3];
    assign P_o[7] = C3[3];
endmodule
