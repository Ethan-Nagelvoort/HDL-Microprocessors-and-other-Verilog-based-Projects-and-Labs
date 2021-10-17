`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 02:00:37 PM
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


module PC(PCC, CLK, PCOut, rst);
input [31:0] PCC;
input CLK, rst;
output [31:0] PCOut;

reg [31:0] next;

initial begin
next<=32'h00000000;
end 

always@(posedge CLK)
begin
if(rst==1)
    next <= 0;
if(rst==0)
    next <= PCC;
end

assign PCOut = next;
    
endmodule
