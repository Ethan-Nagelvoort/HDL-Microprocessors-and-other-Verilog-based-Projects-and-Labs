`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 12:03:37 PM
// Design Name: 
// Module Name: PC
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


module PC(PCC, CLK, PC, rst, PCEn);
input [31:0] PCC;
input CLK, rst;
input PCEn;
output [31:0] PC;

reg [31:0] next;

initial begin
next<=32'h00000;
end 

always@(posedge CLK)
begin
if(rst==1)
    next <= 511;
if(PCEn==1)begin
if(rst==0)
    next <= PCC;
end
end 

assign PC = next;
    
endmodule

