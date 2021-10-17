`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 10:27:30 PM
// Design Name: 
// Module Name: BDmux
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


module BDmux(input ForwardBD, input [31:0] ALUOutM, RFRD2, output reg [31:0] cbd);
always@(*) begin
if(ForwardBD == 1'b1)
cbd <= ALUOutM;
if(ForwardBD == 1'b0)
cbd <= RFRD2;
end
endmodule
