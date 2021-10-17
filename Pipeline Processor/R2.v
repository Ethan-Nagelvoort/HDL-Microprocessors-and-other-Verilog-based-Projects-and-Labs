`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 01:34:59 PM
// Design Name: 
// Module Name: R2
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


module R2(input CLK, CLR, MtoRFSel, RFDSel, ALUInSel, Branch, RFWE, DMWE, input [3:0] ALUsel, input [31:0] RFRD1, RFRD2, simm, 
input[4:0] rd, rt, rs, input[31:0] PCp1D, output reg MtoRFSelE, RFDSelE, ALUInSelE, BranchE, RFWEE, DMWEE, output reg [3:0] ALUselE,
output reg [4:0] rdE, rtE, rsE, output reg [31:0] simmE, RFRD1E, RFRD2E, PCp1E);
always@(posedge CLK)begin
if(CLR == 1'b1) begin
MtoRFSelE <= 0;
RFDSelE <= 0;
ALUInSelE <= 0;
BranchE <= 0;
RFWEE <= 0;
DMWEE <= 0;
ALUselE <= 4'b0000;
PCp1E <= 32'b00000000000000000000000000000000;
rdE <= 5'b00000;
rtE <= 5'b00000;
simmE <= 32'b00000000000000000000000000000000;
RFRD1E <= 32'b00000000000000000000000000000000;
RFRD2E <= 32'b00000000000000000000000000000000;
rsE <= 5'b00000;
end
else begin
MtoRFSelE <= MtoRFSel;
RFDSelE <= RFDSel;
ALUInSelE <= ALUInSel;
BranchE <= Branch;
RFWEE <= RFWE;
DMWEE <= DMWE;
ALUselE <= ALUsel;
PCp1E <= PCp1D;
rdE <= rd;
rtE <= rt;
simmE <= simm;
RFRD1E <= RFRD1;
RFRD2E <= RFRD2;
rsE <= rs; end
end
endmodule
