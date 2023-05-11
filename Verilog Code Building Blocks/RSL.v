`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2023 07:06:15 PM
// Design Name: 
// Module Name: RSL
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


module shift_right_register(
    input clk,
    input load_en,
    input shift_en,
    input [N-1:0] data_in,
    output reg [N-1:0] data_out
);

parameter N = 7;



always @(posedge clk) begin
    if (load_en) begin
        data_out <= data_in;
    end else if (shift_en) begin
        data_out <= {1'b0, data_out[N-1:1]};
    end
end

endmodule