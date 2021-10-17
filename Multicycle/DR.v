`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 02:21:41 PM
// Design Name: 
// Module Name: DR
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


module DR(input CLK, input [31:0] MRD, output reg [31:0] DR);
always@(posedge CLK) begin
DR<=MRD;
end
endmodule
