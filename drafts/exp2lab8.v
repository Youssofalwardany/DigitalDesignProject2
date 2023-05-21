`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 11:55:11 AM
// Design Name: 
// Module Name: exp2lab8
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


module exp2lab8(input clk, rst, x, output y);
reg[1:0] state, nextstate;
parameter [1:0] A = 2'b00, B= 2'b01, C=2'b10;
always @(*) begin
case(state)
A: if (x == 0) nextstate = A; 
else nextstate = B;
B: if (x == 0) nextstate = A;
else nextstate = C;
C: if (x == 0) nextstate = A;
else nextstate = C;
default: nextstate = A;
endcase
end

always @ (posedge clk, posedge rst) begin
if (rst)
state <= A;
else
state <= nextstate;
end

assign y = rst?0: (state ==B);
endmodule


