// distributed memory
module LUTRAM (
    input clk,

    input [7-1 : 0] addr,
    input memwrite;
    input integer data_in,

    // output integer data_out
    output reg integer data_out
);
    reg integer data_mem [0 : 128-1];

    always @(posedge clk) begin
        if (memwrite) data_mem[addr] <= data_in; // sync write
    end

    // assign data_out = data_mem[addr]; // async read

    // sync read
    always @(posedge clk) begin
        data_out <= data_mem[addr];
    end
endmodule
