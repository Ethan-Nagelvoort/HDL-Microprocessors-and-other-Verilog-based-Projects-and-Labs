`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 01:20:55 PM
// Design Name: 
// Module Name: SE
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


module SE( imm, simm, op);
input [5:0] op;
input  [15:0] imm;
output reg [31:0] simm;
reg [15:0] imm2;
always@(*) begin
if(op == 6'b000010 || op == 6'b000100) begin
imm2 = imm + 511;
simm = {{16{imm2[15]}}, imm2};
end
else
simm <= {{16{imm[15]}}, imm};
end

endmodule

