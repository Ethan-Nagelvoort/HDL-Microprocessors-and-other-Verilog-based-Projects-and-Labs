`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 02:40:37 PM
// Design Name: 
// Module Name: ALUIn1Sel
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


module ALUIn1Sel(input ALUIn1Sel, input [31:0] PC, A, output reg [31:0] ALUIn1);
always@(*)begin
if(ALUIn1Sel == 0)
ALUIn1 <= PC;
if(ALUIn1Sel == 1)
ALUIn1 <= A;
end
endmodule
