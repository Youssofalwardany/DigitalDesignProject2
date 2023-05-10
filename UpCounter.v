`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 03:24:02 PM
// Design Name: 
// Module Name: UpCounter
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


module up_counter(clk, clr, ld, cnt, Q, D);
input clk, rst, ld, cnt;
input[3:0] D;
output[3:0] Q;
reg[3:0] Q;

always @ (posedge clk or negedge rst_n) begin
if(rst == 1'b0) Q <= 4'b0; 
else begin
if(ld == 1'b1) Q <= D;
else if(cnt) Q <= Q + 4'b1;
end
end
endmodule
