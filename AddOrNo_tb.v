`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 05:33:43 PM
// Design Name: 
// Module Name: AddOrNo_tb
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


module AddOrNo_tb();
reg [3:0] A;
wire [3:0] B;

addOrNo test(.A(A), .B(B));

initial begin
    $monitor("A=%B, B=%B", A, B);
    #10 A = 4'b0101;
    #10 $finish;
end
endmodule
