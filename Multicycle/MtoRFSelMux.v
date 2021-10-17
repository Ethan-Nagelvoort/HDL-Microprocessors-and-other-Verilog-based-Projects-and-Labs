`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 04:40:32 PM
// Design Name: 
// Module Name: MtoRFSelMux
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


module MtoRFSelMux(input MtoRFSel, input [31:0] DR, ALUOutR, output reg [31:0] RFWD);
always@(*)begin
if(MtoRFSel == 1)
RFWD <= DR;
if(MtoRFSel == 0)
RFWD <= ALUOutR;
end
endmodule
