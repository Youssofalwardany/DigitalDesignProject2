`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 07:32:37 PM
// Design Name: 
// Module Name: BCDTest_tb
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


module BCDTest_tb();
reg [13:0] A;
wire [3:0] BCDU, BCDT, BCDH, BCDTH, BCDTT;
BintoBCD test(A, BCDU, BCDT, BCDH, BCDTH, BCDTT);
initial begin
    A = 14'b11000000000000;
    #10 $finish;
end
endmodule
