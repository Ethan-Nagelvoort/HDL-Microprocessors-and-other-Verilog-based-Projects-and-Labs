`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2020 03:41:40 AM
// Design Name: 
// Module Name: ALUDM
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


module ALUDM(
 input [31:0] ALUOut, 
    DMOut, 
   input  MtoRFSel,
    output reg [31:0] ALUDM
    );
    
always @(*)
begin
    if(MtoRFSel == 1'b0)
        ALUDM = ALUOut;
    else 
        ALUDM = DMOut;
    end
endmodule