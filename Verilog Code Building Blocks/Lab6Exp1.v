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


module fulladder(input[2:0] in, output reg [1:0] out);
wire temp1, temp2;
always @(*) begin
    out[0] <= in[0]^in[1]^in[2];
    out[2] <= in[1]&in[2] || in[0]&in[2] || in[0]&in[1];
end

endmodule
