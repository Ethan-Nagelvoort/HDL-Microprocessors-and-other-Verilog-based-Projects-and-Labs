`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 11:18:42 PM
// Design Name: 
// Module Name: dff
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


module dff #(parameter N = 16) (d, CLK, q, rst);

input [N-1:0] d;
input CLK, rst;
output [N-1:0] q;
reg[32-1:0] temp1;
always @ ( CLK) begin
temp1[15:0] <= d;
if(rst==1)
temp1[31:16] <= 0;
else
temp1[31:16] <= temp1[15:0];
//temp1[95:64]<= temp1[63:32];
  

end
/*
always @ (negedge CLK) begin
temp1[31:0] <= d;
if(rst==1)
temp1[63:32] <= 0;
else
temp1[63:32] <= temp1[31:0];
//temp1[95:64]<= temp1[63:32];
end*/
assign q = temp1[31:16];



endmodule
