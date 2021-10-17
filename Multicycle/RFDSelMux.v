`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 04:36:47 PM
// Design Name: 
// Module Name: RFDSelMux
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


module RFDSelMux(input RFDSel, input [4:0] rt, rd, output reg [4:0] RFWA);
always@(*)begin
if(RFDSel == 1)begin
RFWA <= rd;
end
if(RFDSel == 0)begin
RFWA <= rt;
end
end
endmodule
