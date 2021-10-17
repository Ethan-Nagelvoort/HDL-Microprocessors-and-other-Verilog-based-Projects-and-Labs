`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 11:31:10 AM
// Design Name: 
// Module Name: MEM
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


module MEM(input [31:0] MRA, input MWE, CLK, input [31:0] MWD, output reg [31:0] MRD);
reg [31:0] Mem [0:525];
initial $readmemb("DM.txt", Mem);
always@(*) begin
$readmemh("IM4.txt", Mem ,511);
//Mem[511] = 32'b10001100000010000000000000000000;
MRD <= Mem[MRA]; //PC starts at 512
end
always@(posedge CLK) begin
if(MWE)
Mem[MRA] <= MWD; //PC starts at 512 so sub by 512
end
endmodule

