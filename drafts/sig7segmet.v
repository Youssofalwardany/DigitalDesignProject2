`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 03:02:32 PM
// Design Name: 
// Module Name: sig7segmet
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


module sig7segmet(input x, output [6:0]segment);
if( x == 1'b0)
    assign segment = 7'b1111111;
else
    assign segment = 7'b0000001;
endmodule
