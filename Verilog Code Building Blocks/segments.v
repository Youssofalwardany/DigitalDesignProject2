// file: 7447 BCD-to-7-segment decoder_tb.v
// author: @malaa10
// Testbench for decoder_7447

`timescale 1ns/1ns

module decoder_7447_tb;

reg [3:0] bcd;
wire [6:0] segments;

decoder_7447 uut (
  .bcd(bcd),
  .segments(segments)
);

initial begin
  // Test case 1: Display number 0
  bcd = 4'b0000;
  #10; // Wait 10 time units
  $display("BCD input: %b, Segment output: %b", bcd, segments);

  // Test case 2: Display number 5
  bcd = 4'b0101;
  #10;
  $display("BCD input: %b, Segment output: %b", bcd, segments);

  // Test case 3: Display number 9
  bcd = 4'b1001;
  #10;
  $display("BCD input: %b, Segment output: %b", bcd, segments);

  // Test case 4: Display letter C
  bcd = 4'b1100;
  #10;
  $display("BCD input: %b, Segment output: %b", bcd, segments);

  // Test case 5: Display letter F
  bcd = 4'b1111;
  #10;
  $display("BCD input: %b, Segment output: %b", bcd, segments);

  // Test case 6: Invalid input
  bcd = 4'b1110;
  #10;
  $display("BCD input: %b, Segment output: %b", bcd, segments);
end

endmodule
