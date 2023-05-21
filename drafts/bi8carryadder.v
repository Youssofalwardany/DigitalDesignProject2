`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 12:41:35 PM
// Design Name: 
// Module Name: bi8carryadder
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


module bit8carryadder(input[7:0] A, input[7:0] B,input Cin, output[7:0] S, output Cout
    );
    wire[6:0] carry;
    fulladder adder1(.in({A[0],B[0],Cin}), .out({carry[0], S[0]}));
    fulladder adder2(.in({A[1],B[1],carry[0]}), .out({carry[1], S[1]}));
    fulladder adder3(.in({A[2],B[2],carry[1]}), .out({carry[2],S[2]}));
    fulladder adder4(.in({A[3],B[3],carry[2]}), .out({carry[3],S[3]}));
    fulladder adder5(.in({A[4],B[4],carry[3]}), .out({carry[4], S[4]}));
    fulladder adder6(.in({A[5],B[5],carry[4]}), .out({carry[5], S[5]}));
    fulladder adder7(.in({A[6],B[6],carry[5]}), .out({carry[6],S[6]}));
    fulladder adder8(.in({A[7],B[7],carry[6]}), .out({Cout,S[7]}));
endmodule
