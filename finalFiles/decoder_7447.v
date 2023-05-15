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


module decoder_7447(input [1:0]en, input [3:0] bcd, output reg [3:0]anode_active, output reg [0:6] segments);

always @(*) begin
        case(en)
     0: anode_active = 4'b0111;
     1: anode_active = 4'b1011;
     2: anode_active = 4'b1101;
     3: anode_active = 4'b1110;
     endcase
    case (bcd)
        0: segments = 7'b0000001; // 0 1111110 0000001
        1: segments = 7'b1001111; // 1 0000110 1111001
        2: segments = 7'b0010010; // 2 1101101 0010010
        3: segments = 7'b0000110; // 3 1111001 0000110
        4: segments = 7'b1001100; // 4 0110011 1001100
        5: segments = 7'b0100100; // 5 1011011 0100100
        6: segments = 7'b0100000; // 6 1011111 0100000
        7: segments = 7'b0001111; // 7 1110000 0001111
        8: segments = 7'b0000000; // 8 1111111 0000000
        9: segments = 7'b0001100; // 9 1110011 0001100
        10: segments = 7'b1111110;
        12: segments = 7'b1111111;
        default: segments = 7'b0000000; // no display
    endcase
end

endmodule
