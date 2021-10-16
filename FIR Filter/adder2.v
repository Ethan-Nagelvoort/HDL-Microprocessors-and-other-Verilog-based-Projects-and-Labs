`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 11:33:26 PM
// Design Name: 
// Module Name: adder2
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

module adder2 #(parameter N = 32) (a, b, res);

input signed [N-1:0] a, b;
output signed [N-1:0] res;

assign res = a+b;

endmodule
