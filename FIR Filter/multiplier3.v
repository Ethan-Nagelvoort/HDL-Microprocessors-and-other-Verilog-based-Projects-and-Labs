`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 11:32:23 PM
// Design Name: 
// Module Name: multiplier3
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


module multiplier3 #(parameter N = 32, m=16) (a, b, res);

input signed [m-1:0] a, b;
output signed [N-1:0] res;

assign res = a*b;

endmodule