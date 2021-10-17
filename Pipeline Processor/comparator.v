`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 10:52:27 PM
// Design Name: 
// Module Name: comparator
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


module comparator(input [31:0] cbd, cad, output reg equal);
always@(*) begin
if( cbd == cad)
equal <= 1'b1;
if(cbd != cad)
equal <= 1'b0;
end
endmodule
