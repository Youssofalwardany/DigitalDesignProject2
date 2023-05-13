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


module Multiplier(input clock, start, [7:0] multiplier, [7:0] multiplicand, output  sign,  output reg zflag, output reg [13:0] result);
wire [6:0] comp_multiplier;
wire [7:0] outputMultiplier;
wire [6:0] outputShiftMultiplier;
reg xnoroutput;
wire [6:0] comp_multiplicand;
wire [7:0] outputMultiplicand;
wire [13:0] outputShiftMultiplicand;
reg [13:0] output14bitadder;
wire [13:0] outputmux3;
wire  [13:0] outputdff;

assign sign = (multiplicand[7]  ^ multiplier[7]);

mux #(8)m1(.x(multiplier[7:0]),.y({~multiplier[7:0] + 1'b1}),.sel(multiplier[7]),.out(outputMultiplier));

shift_right_register #(7)sr1(clock, start, ~start, outputMultiplier[6:0], outputShiftMultiplier);

mux #(8)m2(.x(multiplicand[7:0]), .y({~multiplicand[7:0] + 1'b1}), .sel(multiplicand[7]), .out(outputMultiplicand));

shift_left_register#(14) sr2(clock, start, ~start, {7'b0000000, outputMultiplicand[6:0]}, outputShiftMultiplicand);

mux #(14)m3(outputdff, output14bitadder, outputShiftMultiplier[0], outputmux3);
DataReg d1(clock, start,~zflag, outputmux3, outputdff);


always @(*) begin
    xnoroutput <= ~(outputShiftMultiplier[0] | outputShiftMultiplier[1] | outputShiftMultiplier[2] | outputShiftMultiplier[3] | outputShiftMultiplier[4] | outputShiftMultiplier[5] | outputShiftMultiplier[6]);  
    zflag <= xnoroutput; //fix DFF
    result <= outputdff;
    output14bitadder = {outputdff + outputShiftMultiplicand};
end


endmodule
