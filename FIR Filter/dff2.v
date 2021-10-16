`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 11:30:10 PM
// Design Name: 
// Module Name: dff2
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


module dff2 #(parameter N = 16) (d, CLK, q, rst2);

input [N-1:0] d;
input CLK, rst2;
output [N-1:0] q;
reg[N-1:0] temp1;
always @ (CLK) begin
//temp1[31:0] <= d;
if(rst2==1)
temp1[15:0] <= 0;
else
temp1[15:0] <= d;
//temp1[95:64]<= temp1[63:32];
  end
assign q = temp1;


endmodule