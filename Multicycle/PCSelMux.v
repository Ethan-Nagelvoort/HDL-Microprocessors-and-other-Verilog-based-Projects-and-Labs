`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 06:20:00 PM
// Design Name: 
// Module Name: PCSelMux
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


module PCSelMux(input [1:0] PCSel, input[31:0] Jaddr, ALUOutR, ALUOut, output reg [31:0] PCC);
always@(*) begin
if(PCSel == 2'b00)
PCC <= ALUOut;
if(PCSel == 2'b01) begin
PCC <= ALUOutR;
end
if(PCSel == 2'b10)
PCC <= Jaddr;
end
endmodule
