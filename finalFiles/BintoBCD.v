`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 06:03:27 PM
// Design Name: 
// Module Name: BintoBCD
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


module BintoBCD(input [13:0]A, output [3:0]BCDU, [3:0]BCDT, [3:0]BCDH, [3:0]BCDTH, [3:0]BCDTT);
wire [3:0]out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13;
wire [3:0] out14, out15,out17,out18, out19, out20, out21;
wire [3:0] out23, out24,out25,out26, out28, out29;

addOrNo check1(.a({1'b0,A[13:11]}), .b(out1));
addOrNo check2(.a({out1[2:0], A[10]}), .b(out2));
addOrNo check3(.a({out2[2:0], A[9]}), .b(out3));
addOrNo check4(.a({1'b0,out1[3],out2[3], out3[3]}), .b(out4));
addOrNo check5(.a({out3[2:0], A[8]}), .b(out5));
addOrNo check6(.a({out4[2:0], out5[3]}), .b(out6));
addOrNo check7(.a({out5[2:0], A[7]}), .b(out7));
addOrNo check8(.a({out6[2:0], out7[3]}), .b(out8));
addOrNo check9(.a({out7[2:0], A[6]}), .b(out9));
addOrNo check10(.a({1'b0,out4[3],out6[3], out8[3]}), .b(out10));
addOrNo check11(.a({out9[2:0], A[5]}), .b(out11));
addOrNo check12(.a({out11[2:0], A[4]}), .b(out12));
addOrNo check13(.a({out12[2:0], A[3]}), .b(out13));
addOrNo check14(.a({out13[2:0], A[2]}), .b(out14));
addOrNo check15(.a({out14[2:0], A[1]}), .b(out15));
assign BCDU = {out15[2:0], A[0]};
addOrNo check17(.a({out8[2:0],out9[3]}), .b(out17));
addOrNo check18(.a({out17[2:0],out11[3]}), .b(out18));
addOrNo check19(.a({out18[2:0],out12[3]}), .b(out19));
addOrNo check20(.a({out19[2:0],out13[3]}), .b(out20));
addOrNo check21(.a({out20[2:0],out14[3]}), .b(out21));
assign BCDT = {out21[2:0], out15[3]};
addOrNo check23(.a({out10[2:0],out17[3]}), .b(out23));
addOrNo check24(.a({out23[2:0],out18[3]}), .b(out24));
addOrNo check25(.a({out24[2:0],out19[3]}), .b(out25));
addOrNo check26(.a({out25[2:0],out20[3]}), .b(out26));
assign BCDH = {out26[2:0], out21[3]};
addOrNo check28(.a({1'b0,out10[3],out23[3], out24[3]}), .b(out28));
addOrNo check29(.a({out28[2:0],out25[3]}), .b(out29));
assign BCDTH = {out29[2:0], out26[3]};
assign BCDTT = {1'b0,1'b0,out28[3], out29[3]};

endmodule
