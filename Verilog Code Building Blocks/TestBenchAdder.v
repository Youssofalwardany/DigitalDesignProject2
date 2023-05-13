`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 03:31:44 PM
// Design Name: 
// Module Name: TestBenchAdder
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

module testbench_full_adder_14bit;
  
  full_adder_14bit dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );
  
  // inputs
  reg [13:0] a;
  reg [13:0] b;
  reg cin;
  
  // outputs
  wire [14:0] sum;
  wire cout;
  
  // Clock generation
  reg clk;
  always #5 clk = ~clk;
  
 
  initial begin
    a = 14'b10101010101010;
    b = 14'b01010101010101;
    cin = 1'b0;
  end
  
  always @(posedge clk) begin
    cin <= ~cin; 
    #10; 
    $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
  end
  
endmodule
