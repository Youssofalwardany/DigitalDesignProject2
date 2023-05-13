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
module mult_tb;


reg clk, start;
reg [7:0] multiplier,  multiplicand;
wire [13:0] result, sign, zflag;

Multiplier dut(clk, start, multiplier, multiplicand, result, sign, zflag);

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk; // create a 10ns clock cycle
end

initial begin
    reset = 1'b1;
    load_en = 1'b0;
    shift_en = 1'b0;
    data_in = {N{1'b0}};

    #20 start = 1'b0;  // release reset after 100ns
    #10 start = 1'b1; // load data on first cycle
    #10 multiplier = 8'b00000011;
    #10 multiplicand = 8'b00001010; // turn off load enable

    // shift data for 10 cycles
    repeat (10) begin
        #10;
    end

    // finish simulation
    #10 $finish;
end

endmodule

