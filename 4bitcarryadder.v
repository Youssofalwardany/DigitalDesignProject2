`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 11:42:58 AM
// Design Name: 
// Module Name: 4bitcarryadder
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


module bit4carryadder(input[3:0] A, input[3:0] B,input Cin, output[3:0] S, output Cout
    );
    wire[2:0] carry;
    fulladder adder1(.in({A[0],B[0],Cin}), .out({carry[0], S[0]}));
    fulladder adder2(.in({A[1],B[1],carry[0]}), .out({carry[1], S[1]}));
    fulladder adder3(.in({A[2],B[2],carry[1]}), .out({carry[2],S[2]}));
    fulladder adder4(.in({A[3],B[3],carry[2]}), .out({Cout,S[3]}));
endmodule
