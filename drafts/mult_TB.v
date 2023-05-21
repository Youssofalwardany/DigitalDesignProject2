`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 03:48:07 PM
// Design Name: 
// Module Name: RSRsim
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
module Multiplier_tb;
    reg clock;
    reg start;
    reg [7:0] multiplier;
    reg [7:0] multiplicand;
    wire [3:0]sign;
    wire zflag;
    wire [13:0] result;

    Multiplier multiplier_inst(
        .clock(clock),
        .start(start),
        .multiplier(multiplier),
        .multiplicand(multiplicand),
        .sign(sign),
        .done(zflag),
        .result(result)
    );

    initial begin
        clock = 0;
        start = 0;
        multiplier = 8'd3;
        multiplicand = 8'd10;
        #10 start = 1;
        #200 $finish;
    end

    always #5 clock = ~clock;

    initial begin
        $dumpfile("Multiplier_tb.vcd");
        $dumpvars(0, multiplier_inst);
        #10;
    end

endmodule
/*module Display_tb;

  reg clk = 0;
  reg rst = 0;
  reg digit1 = 0;
  reg digit2 = 0;
  reg digit3 = 0;
  reg digit4 = 0;

  wire [6:0] seg;
  wire [3:0] anode_active;

  Display uut (
    .clk(clk),
    .rst(rst),
    .digit1(digit1),
    .digit2(digit2),
    .digit3(digit3),
    .digit4(digit4),
    .seg(seg),
    .anode_active(anode_active)
  );

  always #5 clk = ~clk;

  initial begin

    rst = 1;
    #10 rst = 0;

    digit1 = 4'b0000; digit2 = 4'b0001; digit3 = 4'b0010; digit4 = 4'b0011;
    #100;
    digit1 = 4'b0011; digit2 = 4'b0010; digit3 = 4'b0001; digit4 = 4'b0000;
    #100;
    digit1 = 4'b0000; digit2 = 4'b0001; digit3 = 4'b0010; digit4 = 4'b0011;
    #100;
    digit1 = 4'b0011; digit2 = 4'b0010; digit3 = 4'b0001; digit4 = 4'b0000;
    #100;
   $finish;
end

endmodule
*/

