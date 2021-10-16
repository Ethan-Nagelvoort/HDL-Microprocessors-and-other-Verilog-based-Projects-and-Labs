`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2021 01:57:34 PM
// Design Name: 
// Module Name: Top_module
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


module Top_module #(parameter N=4)(clk, rst, bit0, bit1, bit2, bit3, fullNum);
input clk,rst; 
output bit0, bit1, bit2, bit3;
output [N-1:0] fullNum;
wire [N-1:0] wire1; 
wire [N-1:0] wire2; 

Incrementer DUT (.in(wire1), .out(wire2));

four_bit_reg DUT1 (.clk(clk), .rst(rst), .in1(wire2), .out1(wire1));

assign bit0 = wire1[0];
assign bit1 = wire1[1];
assign bit2 = wire1[2];
assign bit3 = wire1[3];
assign fullNum = wire1;
endmodule
