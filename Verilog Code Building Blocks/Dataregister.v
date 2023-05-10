`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 03:15:43 PM
// Design Name: 
// Module Name: Dataregister
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
module DFF( clk, reset_n, d, q, qb );
input d, clk, reset_n;
output reg q;
output qb;
always @(posedge clk or negedge reset_n)
if(!reset_n)
q <= 1'b0;
else
q <= d;
assign qb = ~q;
endmodule

module DataReg(
  input clk, rst_n, load_en,
  input [13:0] data_in,
  output [13:0] data_out
);

  wire [13:0] q;
  wire [13:0] qb;

  DFF dff_0(.clk(clk), .reset_n(rst_n), .d(data_in[0]), .q(q[0]), .qb(qb[0]));
  DFF dff_1(.clk(clk), .reset_n(rst_n), .d(data_in[1]), .q(q[1]), .qb(qb[1]));
  DFF dff_2(.clk(clk), .reset_n(rst_n), .d(data_in[2]), .q(q[2]), .qb(qb[2]));
  DFF dff_3(.clk(clk), .reset_n(rst_n), .d(data_in[3]), .q(q[3]), .qb(qb[3]));
  DFF dff_4(.clk(clk), .reset_n(rst_n), .d(data_in[4]), .q(q[4]), .qb(qb[4]));
  DFF dff_5(.clk(clk), .reset_n(rst_n), .d(data_in[5]), .q(q[5]), .qb(qb[5]));
  DFF dff_6(.clk(clk), .reset_n(rst_n), .d(data_in[6]), .q(q[6]), .qb(qb[6]));
  DFF dff_7(.clk(clk), .reset_n(rst_n), .d(data_in[7]), .q(q[7]), .qb(qb[7]));
  DFF dff_8(.clk(clk), .reset_n(rst_n), .d(data_in[8]), .q(q[8]), .qb(qb[8]));
  DFF dff_9(.clk(clk), .reset_n(rst_n), .d(data_in[9]), .q(q[9]), .qb(qb[9]));
  DFF dff_10(.clk(clk), .reset_n(rst_n), .d(data_in[10]), .q(q[10]), .qb(qb[10]));
  DFF dff_11(.clk(clk), .reset_n(rst_n), .d(data_in[11]), .q(q[11]), .qb(qb[11]));
  DFF dff_12(.clk(clk), .reset_n(rst_n), .d(data_in[12]), .q(q[12]), .qb(qb[12]));
  DFF dff_13(.clk(clk), .reset_n(rst_n), .d(data_in[13]), .q(q[13]), .qb(qb[13]));

  assign data_out = q;

endmodule
