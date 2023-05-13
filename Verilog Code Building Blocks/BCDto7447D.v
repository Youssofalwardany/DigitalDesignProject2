`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 02:05:09 PM
// Design Name: 
// Module Name: BCDto7447D
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


module BCDto7447D(
    input clock, 
    input start,
    input [3:0] BCDU, 
    input [3:0] BCDT, 
    input [3:0] BCDH, 
    input [3:0] BCDTH, 
    input [3:0] BCDTT, 
    output [3:0] segments
);

reg [3:0] bcd;

BCDtoBin bin(BCDU, BCDT, BCDH, BCDTH, BCDTT, bcd);

decoder_7447 dec(bcd, segments);

always @(posedge clock) begin
    if (start) begin
        bcd <= 4'b0000;
        segments <= 7'b1111111;
    end else begin
        bcd <= BCDU;
    end
end

endmodule
