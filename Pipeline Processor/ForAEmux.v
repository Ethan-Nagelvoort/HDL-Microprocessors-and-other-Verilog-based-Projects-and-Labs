`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 09:28:35 PM
// Design Name: 
// Module Name: ForAEmux
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


module ForAEmux(input [1:0] ForwardAE, input [31:0]ALUOutM, ALUDM, RFRD1E,
output reg [31:0] out );
always@(*)begin
if(ForwardAE == 2'b00)
out <= RFRD1E;
if(ForwardAE == 2'b01)
out <= ALUDM;
if(ForwardAE == 2'b10)
out <= ALUOutM; 
end
endmodule
