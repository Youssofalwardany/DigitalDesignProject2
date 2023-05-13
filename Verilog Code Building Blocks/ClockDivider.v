`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2023 11:21:04 AM
// Design Name: 
// Module Name: ClockDivider
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


module clockDivider #(parameter n = 50000000)
(input clk, rst, output reg clk_out);
wire [31:0] count;
// Big enough to hold the maximum possible value
// Increment count
BinaryCounter #(32, n) counter(.clk(clk), .reset(rst), .count(count), .en(1));
// Handle the output clock
always @ (posedge clk, posedge rst) begin
    if (rst) // Asynchronous Reset
        clk_out <= 0;
    else if (count == n-1)
        clk_out <= ~ clk_out;
end
endmodule
