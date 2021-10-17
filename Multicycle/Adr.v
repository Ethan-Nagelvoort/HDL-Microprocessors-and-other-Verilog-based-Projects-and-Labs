`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 02:17:55 PM
// Design Name: 
// Module Name: Adr
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


module Adr(input IDSel, input [31:0] PC, ALUOutR, output reg [31:0] Adr);
always@(*)begin
if(IDSel == 1)
Adr <= ALUOutR;
if(IDSel == 0) 

Adr <= PC;

end 
endmodule
