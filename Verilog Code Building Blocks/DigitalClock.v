`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2023 11:10:23 AM
// Design Name: 
// Module Name: DigitalClock
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


module DigitalClock(
    input clk, rst, output [0:6] segments, [3:0] anode_active 
    );
    wire clkOut;
    wire [1:0]count;
    wire [3:0] secondsTen, minustesTen;
    wire [3:0] secondsSix, minutesSix;
    reg [3:0] num;
    clockDivider#(25000) step1(clk, rst, clkOut);
    BinaryCounter #(2,4) step2(clkOut, rst, count, 1);
    Seconds_and_min step3(clk, rst, secondsTen, minustesTen, secondsSix, minutesSix);
    SevenSegDecWithEn final(count,num,segments,anode_active); 
    always @ (posedge clkOut) begin
    case(count)
    0: num = minutesSix;
    1: num = minustesTen;
    2: num = secondsSix;
    3: num = secondsTen;
    endcase
    end 
endmodule
