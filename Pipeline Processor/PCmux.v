`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2020 01:28:09 PM
// Design Name: 
// Module Name: PCmux
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


module PCmux(PCNow, PCnew, PCsel, PCC);
input [31:0] PCNow, PCnew;
input PCsel;
output reg [31:0] PCC;
always@(*) begin
if(PCsel == 1'b1)
 PCC <= PCnew;
else
 PCC <= PCNow;
end
endmodule
