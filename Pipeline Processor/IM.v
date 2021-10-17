`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2020 08:55:10 PM
// Design Name: 
// Module Name: IM
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


module IM #(parameter WL=32)
(input [WL-1:0] IMA, output reg [WL-1:0] IMRD);
reg [WL-1:0] Mem [0:12];
initial $readmemb("IM3.txt", Mem);
always@(*) begin
IMRD = Mem[IMA];//send data to IMD from Mem[IMA]
end
endmodule

