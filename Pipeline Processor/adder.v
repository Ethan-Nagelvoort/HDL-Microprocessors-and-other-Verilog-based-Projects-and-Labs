// Revision 0.01 - `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 04:14:19 PM
// Design Name: 
// Module Name: adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
//File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder(PCOut, PCNow);
input [31:0] PCOut;
output reg [31:0] PCNow;
always@(*) begin
PCNow = PCOut + 1; 
end
endmodule
