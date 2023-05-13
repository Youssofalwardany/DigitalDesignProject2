`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 08:29:06 PM
// Design Name: 
// Module Name: decoder_7447
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


module decoder_7447(input [1:0]en, input [3:0] bcd, output reg [3:0]anode_active, output reg [6:0] segments);

always @(*) begin
        case(en)
     0: anode_active = 4'b0111;
     1: anode_active = 4'b1011;
     2: anode_active = 4'b1101;
     3: anode_active = 4'b1110;
     endcase
    case (bcd)
        0: segments = 7'b1000000; // 0
        1: segments = 7'b1111001; // 1
        2: segments = 7'b0100100; // 2
        3: segments = 7'b0110000; // 3
        4: segments = 7'b0011001; // 4
        5: segments = 7'b1101101; // 5
        6: segments = 7'b0000010; // 6
        7: segments = 7'b1111000; // 7
        8: segments = 7'b0000000; // 8
        9: segments = 7'b0010000; // 9
        default: segments = 7'b1111111; // no display
    endcase
end

endmodule
