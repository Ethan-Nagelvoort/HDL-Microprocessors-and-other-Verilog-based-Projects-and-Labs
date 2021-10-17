`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 12:29:49 PM
// Design Name: 
// Module Name: A
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


module A(input CLK, input [31:0] RFRD1, RFRD2, output reg [31:0] A, B);
always@(posedge CLK) begin
A <= RFRD1;
B <= RFRD2;
end
endmodule
