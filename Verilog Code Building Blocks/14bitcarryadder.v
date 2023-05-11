`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 04:19:16 PM
// Design Name: 
// Module Name: 14bitcarryadder
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


module bit14carryadder(input cin, [13:0] a, [13:0]b, output [13:0] s);
wire cout[3:0];
bit8carryadder add1 (a[7:0], b[7:0], cin, s[7:0], cout[0]);
bit4carryadder add2 (a[11:8], b[11:8], cout[0], s[11:8], cout[1]); 
fulladder adder1(.in({a[12],b[12],cout[1]}), .out({cout[2], s[12]}));
fulladder adder2(.in({a[13],b[13],cout[3]}), .out({cout[3], s[13]}));

endmodule
