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
module shift_right_register_tb;

parameter N = 14;

reg clk, reset, load_en, shift_en;
reg [N-1:0] data_in;
wire [N-1:0] data_out;

shift_right_register dut(
    .clk(clk),
    .reset(reset),
    .load_en(load_en),
    .shift_en(shift_en),
    .data_in(data_in),
    .data_out(data_out)
);

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk; // create a 10ns clock cycle
end

initial begin
    reset = 1'b1;
    load_en = 1'b0;
    shift_en = 1'b0;
    data_in = {N{1'b0}};

    #20 reset = 1'b0;  // release reset after 100ns
    #10 load_en = 1'b1; // load data on first cycle
    #10 data_in = 14'b10101000000011;
    #10 load_en = 1'b0; // turn off load enable
    #10 shift_en = 1'b1; // start shifting

    // shift data for 10 cycles
    repeat (10) begin
        #10;
    end

    // finish simulation
    #10 $finish;
end

endmodule

