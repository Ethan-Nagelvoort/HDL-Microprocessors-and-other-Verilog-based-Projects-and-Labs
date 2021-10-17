`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 01:55:43 PM
// Design Name: 
// Module Name: ALUOutR
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


module ALUOutR(input [31:0] ALUOut, input CLK, output reg [31:0] ALUOutR);
always@(posedge CLK) begin
ALUOutR <= ALUOut;
end
endmodule
