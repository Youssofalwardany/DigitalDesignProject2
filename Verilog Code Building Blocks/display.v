`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 08:25:44 PM
// Design Name: 
// Module Name: display
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


module Display(
    input clk, rst, digit1, digit2, digit3, digit4, output [0:6] seg, output [3:0]anode_active
    );
    wire clkOut;
    wire [1:0]count;
    reg [3:0] num;
    clockDivider#(25000) step1(clk, rst, clkOut);
    BinaryCounter #(2,4) step2(clkOut, rst, count, 1);
    decoder_7447 final(count,num, anode_active, seg); 
    always @ (posedge clkOut) begin
    case(count)
    0: num = digit1;
    1: num = digit2;
    2: num = digit3;
    3: num = digit4;
    endcase
    end
endmodule

