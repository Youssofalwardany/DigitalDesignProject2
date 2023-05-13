`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 03:27:34 PM
// Design Name: 
// Module Name: Adder
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


module Adder (
  input [13:0] a,
  input [13:0] b,
  input cin,
  output [14:0] sum,
  output cout
);

  wire [13:0] carry;
  
  // carry bits for each bit position
  generate
    genvar i;
    for (i = 0; i < 14; i = i + 1) begin
      if (i == 0) begin
        
        full_adder FA(a[i], b[i], cin, sum[i], carry[i+1]);
      end else begin
        
        full_adder FA(a[i], b[i], carry[i-1], sum[i], carry[i]);
      end
    end
  endgenerate
  
  
  assign cout = carry[13];
  
endmodule

//  single full adder
module full_adder (
  input a,
  input b,
  input cin,
  output sum,
  output carry
);

  assign sum = a ^ b ^ cin;
  assign carry = (a & b) | (a & cin) | (b & cin);
  
endmodule





