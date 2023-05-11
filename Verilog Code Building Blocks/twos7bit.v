`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 06:41:15 PM
// Design Name: 
// Module Name: twos7bit
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


module twos_complement (
    input [6:0] input_number,
    output reg [6:0] twos_comp
);
    assign twos_complement = ~input_number + 1'b1;

endmodule