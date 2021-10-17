`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 01:08:24 PM
// Design Name: 
// Module Name: R1
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


module R1(input CLK, Stall, CLR, input [31:0] IMRD, PCp1F, output reg [31:0] instrD, PCp1D);
always@(posedge CLK)begin



//PCp1D <= PCp1F;
if(CLR == 1'b1)begin
instrD <= 32'b00000000000000000000000000000000;
PCp1D <= 0;
end
else begin
if(Stall == 1'b1) begin
instrD<=0;
PCp1D <= 0; end
else begin
instrD<= IMRD;
PCp1D <= PCp1F; end
end end
endmodule
