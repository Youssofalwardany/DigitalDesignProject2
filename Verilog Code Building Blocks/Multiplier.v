module Multiplier(input clock, start, [7:0] multiplier, [7:0] multiplicand, output  sign,  output reg zflag, output reg [13:0] result);

wire [6:0] comp_multiplier;
wire [6:0] outputMultiplier;
wire [6:0] outputShiftMultiplier;
reg xnoroutput;
wire [6:0] comp_multiplicand;
wire [6:0] outputMultiplicand;
wire [6:0] outputShiftMultiplicand;
wire [13:0] output14bitadder;
wire [13:0] output14bitadder;
wire [13:0] outputmux3;
wire [13:0] outputdff;

assign sign = (multiplicand[7]  ^ multiplier[7]);

shift_right_register #(7)sr1(clock, start, ~start, multiplier[6:0], outputShiftMultiplier[6:0]);
twos_complement t1(.input_number(multiplier[6:0]),.twos_comp(comp_multiplier));
mux m1(.x(multiplier[6:0]),.y(comp_multiplier),.sel(multiplier[7]),.out(outputMultiplier));
twos_complement t2(.input_number(multiplicand[6:0]), .twos_comp(comp_multiplicand));
mux m2(.x(multiplicand[6:0]), .y(comp_multiplicand), .sel(multiplicand[7]), .out(outputMultiplicand));

shift_right_register #(14) sr2(clock, start, ~start, {multiplicand[6:0],7'b0000000}, outputMultiplicand);
mux m3(outputdff, output14bitadder, outputShiftMultiplier[6] , outputmux3);
DataReg d1(clk, start,~zflag, outputmux3, outputdff);
bit14carryadder adder(1'b0, outputMultiplicand, outputdff, output14bitadder);



always @(posedge clock) begin
    xnoroutput <= ~(outputShiftMultiplier[0] | outputShiftMultiplier[1] | outputShiftMultiplier[2] | outputShiftMultiplier[3] | outputShiftMultiplier[4] | outputShiftMultiplier[5] | outputShiftMultiplier[6]);  
    
    zflag <= xnoroutput; //fix DFF 
    result <= outputdff;
end


endmodule
