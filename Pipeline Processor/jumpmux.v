`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2020 05:09:39 PM
// Design Name: 
// Module Name: jumpmux
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


module jumpmux(Jump, PCJump, PCC, PCC2);
input Jump;
input [31:0] PCJump, PCC;
output reg [31:0] PCC2;
always@(*) begin
if(Jump == 1'b1)
  PCC2 <= PCJump;
else
    PCC2 <= PCC;
end
endmodule
