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


module shift_left_register(
    input clk,
    input load_en,
    input shift_en,
    input [N-1:0] data_in,
    output reg [N-1:0] data_out
);

parameter N = 14;

always @(posedge clk) begin
    if (load_en) begin
        data_out <= data_in;
    end else if (shift_en) begin
        data_out <= {data_out[N-2:0], 1'b0};
    end
end

endmodule
