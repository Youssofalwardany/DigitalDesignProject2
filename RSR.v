`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 03:47:01 PM
// Design Name: 
// Module Name: RSR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shift_right_register(
    input clk,
    input reset,
    input load_en,
    input shift_en,
    input [N-1:0] data_in,
    output [N-1:0] data_out
);

parameter N = 14;

reg [N-1:0] shift_reg;

always @(posedge clk) begin
    if (reset) begin
        shift_reg <= {N{1'b0}};
    end else if (load_en) begin
        shift_reg <= data_in;
    end else if (shift_en) begin
        shift_reg <= {1'b0, shift_reg[N-1:1]};
    end
end

assign data_out = shift_reg;

endmodule
