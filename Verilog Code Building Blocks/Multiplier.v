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
wire [6:0] outputMultiplier;
wire [6:0] outputShiftMultiplier;
reg xnoroutput;
wire [6:0] comp_multiplicand;
wire [6:0] outputMultiplicand;
wire [6:0] outputShiftMultiplicand;
reg [13:0] output14bitadder;
wire [13:0] outputmux3;
wire  [13:0] outputdff;
wire [13:0]bit14 = {7'b0000000, outputMultiplicand};

assign sign = (multiplicand[7]  ^ multiplier[7]);

twos_complement t1(.input_number(multiplier[6:0]),.twos_comp(comp_multiplier));

mux m1(.x(multiplier[6:0]),.y(comp_multiplier),.sel(multiplier[7]),.out(outputMultiplier));

shift_right_register #(7)sr1(clock, start, ~start, outputMultiplier, outputShiftMultiplier);

twos_complement t2(.input_number(multiplicand[6:0]), .twos_comp(comp_multiplicand));

mux m2(.x(multiplicand[6:0]), .y(comp_multiplicand), .sel(multiplicand[7]), .out(outputMultiplicand));

shift_left_register sr2(clock, start, ~start, bit14, outputShiftMultiplicand);

//bit14carryadder adder(1'b0, multiplier, multiplier, output14bitadder);


mux #(14)m3(outputdff, output14bitadder, outputShiftMultiplier[0], outputmux3);
DataReg d1(clock, start,~zflag, outputmux3, outputdff);

always @(*) begin
    xnoroutput <= ~(outputShiftMultiplier[0] | outputShiftMultiplier[1] | outputShiftMultiplier[2] | outputShiftMultiplier[3] | outputShiftMultiplier[4] | outputShiftMultiplier[5] | outputShiftMultiplier[6]);  
    zflag <= xnoroutput; //fix DFF
    result <= outputdff;
    output14bitadder = {outputdff + outputShiftMultiplicand};
end


endmodule
