`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 12:08:35 PM
// Design Name: 
// Module Name: pushbutton_detector
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


module pushbutton_detector(input clk, rst, x, output  pulse);
wire clkout;
clockDivider #(500000)clock(clk, rst, clkout);
wire debOut;
debouncer deb(clkout, rst, x, debOut);
wire out2;
synch syn(clkout, rst, debOut, out2);
exp2lab8 rising(clkout, rst, out2, pulse);
endmodule
