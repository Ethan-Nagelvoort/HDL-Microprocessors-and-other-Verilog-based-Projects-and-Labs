`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 02:59:03 PM
// Design Name: 
// Module Name: ALUIn2Sel
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


module ALUIn2Sel(input[31:0] simm, B, input[1:0] ALUIn2Sel, output reg [31:0] ALUIn2);
always@(*)begin
if(ALUIn2Sel==2'b10)
ALUIn2 <= simm;
if(ALUIn2Sel==2'b01)
ALUIn2 <= 1;
if(ALUIn2Sel==2'b00)
ALUIn2 <= B;
end
endmodule
