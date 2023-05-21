`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 05:21:09 PM
// Design Name: 
// Module Name: addOrNo
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


module addOrNo(input [3:0]a, output [3:0]b);
assign b[0] = (~a[3]&~a[2]&a[0]) || (a[2]&a[1]&~a[0]) || (a[3]&~a[0]);
assign b[1] = (~a[2]&a[1]) || (a[1]&a[0]) || (a[3]&~a[0]);
assign b[2] = (a[2]&~a[1]&~a[0]) || (a[3]&a[0]);
assign b[3] = (a[2] & a[0]) || (a[2] & a[1]) || (a[3] & ~a[2] & ~a[1]);
    
endmodule
