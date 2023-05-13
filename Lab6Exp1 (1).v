`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 11:17:28 AM
// Design Name: 
// Module Name: Lab6Exp1
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


module fulladder(input[2:0] in, output[1:0] out);

assign out[0] = in[0]^in[1]^in[2];
assign out[1] = in[1]&in[2] || in[0]&in[2] || in[0]&in[1];

endmodule
