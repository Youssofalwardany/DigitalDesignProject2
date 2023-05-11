`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 03:36:30 PM
// Design Name: 
// Module Name: MUX
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


module mux (x, y, sel, out);
input [N-1:0] x; 
input [N-1:0] y;
input sel;
output reg [N-1:0] out;
parameter N = 7;
always @ (*) begin
    if (sel == 1)
        out <= y;
    else
        out <= x;
    end
endmodule
