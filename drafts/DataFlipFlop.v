`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 04:12:56 PM
// Design Name: 
// Module Name: DataFlipFlop
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


module DFF( clk, reset_n, d, q, qb );
input d, clk, reset_n;
output reg q;
output qb;
always @(posedge clk or negedge reset_n)
if(!reset_n)
q <= 1'b0;
else
q <= d;
assign qb = ~q;
endmodule
