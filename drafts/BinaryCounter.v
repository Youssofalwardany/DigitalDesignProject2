`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2023 10:48:59 AM
// Design Name: 
// Module Name: BinaryCounter
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


module BinaryCounter #(parameter x = 3 , parameter n = 3)
(input clk, reset, output [x-1:0]count, input en);
reg [x-1:0] count;
always @(posedge clk, posedge reset) begin
 if (reset == 1)
 count <= 0; // non-blocking assignment
 // initialize flip flop here
 else
 begin
     if(en == 1)
         begin
         if(count == n-1)
             count <= 0;
         else
             count <= count + 1; // non-blocking assignment
         end
    end
end
endmodule

