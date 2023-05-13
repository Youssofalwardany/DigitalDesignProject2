`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2023 01:12:32 PM
// Design Name: 
// Module Name: SevenSegDecCase
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


module SevenSegDecWithEn(
input [0:1] en,
input [3:0] num,
output reg [0:6] segments,
output reg [3:0] anode_active);

always @ (*) begin
     case(en)
     0: anode_active = 4'b0111;
     1: anode_active = 4'b1011;
     2: anode_active = 4'b1101;
     3: anode_active = 4'b0001;
     endcase
     case(num)
    0: segments = 7'b0000001;
    1: segments = 7'b1001111;
    2: segments = 7'b0010010;
    3: segments = 7'b0000110;
    4: segments = 7'b1001100;
    5: segments = 7'b1011011;
    6: segments = 7'b0100000;
    7: segments = 7'b0001111;
    8: segments = 7'b0000000;
    9: segments = 7'b0001100;
    10: segments = 7'b0001000;
    11: segments = 7'b1100000;
    12: segments = 7'b0110001;
    13: segments = 7'b1000010;
    14: segments = 7'b0110000;
    15: segments = 7'b0111000;
endcase
end
endmodule
