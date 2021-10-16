`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 11:44:49 PM
// Design Name: 
// Module Name: Top
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


module Top(input CLK, CLK2, rst, rst2, input [16-1:0] x, h0, h1, h2, output [32-1:0]y );
parameter w = 32; 
parameter g = 16;
wire [g-1:0] x1;
wire [g-1:0] x2;
wire [w-1:0] x3;
wire [w-1:0] x4;
wire [w-1:0] x5;
wire [w-1:0] x6;
wire [w-1:0] x7;
wire [w-1:0] x8;
wire [w-1:0] x9;
wire [w-1:0] x10;


dff DUT (.CLK(CLK2), .d(x), .q(x1), .rst(rst));

dff2 DUT1 (.CLK(CLK2), .d(x1), .q(x2), .rst2(rst2));

multiplier DUT2 (.a(h0), .b(x), .res(x5));

multiplier2 DUT3(.a(h1), .b(x1), .res(x3));

multiplier3 DUT4(.a(h2), .b(x2), .res(x4));

adder DUT5(.a(x5), .b(x3), .res(x6));

adder2 DUT6(.a(x6), .b(x4), .res(x7));
assign y= x7;
endmodule
