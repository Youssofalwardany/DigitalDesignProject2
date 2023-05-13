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
    input clk, rst, [3:0]digit1, [3:0]digit2, [3:0]digit3, [3:0]digit4, output [0:6] seg, output [3:0]anode_active
    );
    wire clkOut;
    wire [1:0]count;
    reg [3:0] num;
    clockDivider#(25000) step1(clk, rst, clkOut);
    BinaryCounter #(2,4) step2(clkOut, rst, count, 1);
    decoder_7447 final(count,num, anode_active, seg); 
    always @ (posedge clkOut) begin
    case(count)
    0: num = digit4;
    1: num = digit3;
    2: num = digit2;
    3: num = digit1;
    endcase
    end
endmodule

