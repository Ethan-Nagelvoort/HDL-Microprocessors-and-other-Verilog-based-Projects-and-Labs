`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2020 01:25:09 PM
// Design Name: 
// Module Name: adder2
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


module adder2(simm, PCNow,PCnew);
input [31:0] simm, PCNow;
output reg [31:0] PCnew;
always@(*) begin
PCnew = simm + PCNow;
end
endmodule
