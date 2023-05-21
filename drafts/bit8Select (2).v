`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:30:41 PM
// Design Name: 
// Module Name: bit8Select
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


module bit8Select();
    reg cin;
    reg [7:0]a;
    reg[7:0]b;
    wire [7:0]s;
    wire cout;
    wire ref_cout, err;
    wire [7:0]ref_s;
    
    // instantiate device under test
    select8adder adder(.A(a), .B(b), .Cin(cin), .S(s), .Cout(cout)); 
    // Golden Model
    assign {ref_cout, ref_s} = a+b+cin;
    // The Checker
    assign err = (ref_s != s) || (ref_cout != cout);
    integer i;
    initial begin
    for ( i = 0; i < 131072; i = i + 1 ) begin
     {a,b,cin} = i; #1
     // every 10 ns set x, y, cin to the binary rep. of i
     if (err == 1)
     $display("Input combination %d failed.", i);
    end
    end
endmodule
