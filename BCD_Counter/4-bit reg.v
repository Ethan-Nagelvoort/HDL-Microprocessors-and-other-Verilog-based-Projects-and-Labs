`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2021 01:47:42 PM
// Design Name: 
// Module Name: 4-bit reg
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


module four_bit_reg #(parameter N=4) (in1, out1, rst, clk);
input [N-1:0] in1;
input rst, clk; 
output reg [N-1:0] out1; 
always @ (posedge clk) begin
if((rst == 1) || (in1>4'b1111))begin
out1 <= 4'b0000;
end
if((rst == 0) || (in1<=4'b1111))begin
out1 <= in1;
end
end
endmodule
