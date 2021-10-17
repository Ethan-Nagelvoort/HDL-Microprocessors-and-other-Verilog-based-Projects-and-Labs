`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2020 08:59:30 PM
// Design Name: 
// Module Name: DM
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


module DM#(parameter WL=32)
(input CLK, DMWE, input [WL-1:0] DMA,
input [WL-1:0] DMWD, 
output reg [WL-1:0] DMRD);
reg [WL-1:0] Mem [0:60];
initial $readmemb("DM.txt", Mem);
always@(*) begin //everytime DMA changes, this always block occurs
DMRD = Mem[DMA];
end
always@(posedge CLK) begin // everytime posedge, this always block occurs
if(DMWE) begin
Mem[DMA] <= DMWD;
end
end
endmodule