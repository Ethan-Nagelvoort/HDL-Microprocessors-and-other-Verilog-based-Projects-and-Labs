`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2020 01:18:01 PM
// Design Name: 
// Module Name: PCsel
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


module PCsel(Zero, Branch, PCsel);
input Zero, Branch;
output reg PCsel; 
always@(*) begin
if (Zero == 1'b1 && Branch == 1'b1)
PCsel <= 1'b1;
else
PCsel <= 1'b0;
end
endmodule
