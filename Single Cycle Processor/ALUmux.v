`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2020 03:14:55 AM
// Design Name: 
// Module Name: ALUmux
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


module ALUmux(
    input [31:0]RFRD2, //RF
    simm, //simm
    input ALUInSel,
    output reg [31:0] ALUIn2
    );
    
always @(*)
begin
    if(ALUInSel == 1'b0)
        ALUIn2 = RFRD2;
    else
        ALUIn2 = simm;
    end
endmodule
