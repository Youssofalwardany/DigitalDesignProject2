`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 04:48:46 PM
// Design Name: 
// Module Name: Multiplier
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


module Multiplier (
  input clock,
  input start,
  input [7:0] multiplier,
  input [7:0] multiplicand,
  output [3:0] sign,
  output reg zflag,
  output reg [13:0] result
);
  reg load_shifter;
  reg shift_en;
  reg Product_reg_en;
  reg Product_reg_rst;
  wire [6:0] outputShiftMultiplier;
  wire [13:0] inputShiftMultiplicand = {7'b0000000, multiplicand[6:0]};
  wire [13:0] outputShiftMultiplicand;
  reg [13:0] output14bitadder;
  wire [13:0] outputmux3;
  wire [13:0] outputdff;

  assign sign = (multiplicand[7] ^ multiplier[7]) ? 4'b1010 : 4'b1100;

  shift_right_register #(7) sr1 (
    .clk(clock),
    .load_en(load_shifter),
    .shift_en(shift_en),
    .data_in(multiplier[6:0]),
    .data_out(outputShiftMultiplier)
  );

  shift_left_register #(14) sr2 (
    .clk(clock),
    .load_en(load_shifter),
    .shift_en(shift_en),
    .data_in(inputShiftMultiplicand),
    .data_out(outputShiftMultiplicand)
  );

  mux #(14) m3 (
    .x(outputdff),
    .y(output14bitadder),
    .sel(outputShiftMultiplier[0]),
    .out(outputmux3)
  );

  DataReg d1 (
    .clk(clock),
    .rst(Product_reg_rst),
    .enable(Product_reg_en),
    .in(outputmux3),
    .out(outputdff)
  );

  always @(*) begin
    zflag = ~(|outputShiftMultiplier);
    result = outputdff;
    load_shifter = start;
    shift_en = ~start;
    Product_reg_en = ~zflag;
    Product_reg_rst = start;
    output14bitadder = {outputdff + outputShiftMultiplicand};
  end

endmodule