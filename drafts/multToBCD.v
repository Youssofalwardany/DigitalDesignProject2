`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 01:40:28 PM
// Design Name: 
// Module Name: multToBCD
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


module multToBCD(input clock, startButton, [7:0] multy, [7:0] multiplicand, output zflag, output [3:0]anode_active, output [0:6] finalseg);
wire start;
pushbutton_detector bstart(clock, 1'b0, startButton, start);  
wire [13:0]temp;
wire [3:0] BCDU, BCDT, BCDH, BCDTH, BCDTT, sign;
Multiplier mult(clock, start, multy, multiplicand, sign, zflag, temp);
BintoBCD BCD(temp, BCDU, BCDT, BCDH, BCDTH, BCDTT);
Display  dis(clock, start, sign , BCDU, BCDT, BCDH, finalseg, anode_active);
endmodule
