`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 10:35:47 PM
// Design Name: 
// Module Name: ADmux
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


module ADmux(input ForwardAD, input [31:0] RFRD1, ALUOutM, output reg [31:0] cad);
always@(*) begin
if(ForwardAD == 1'b1)
cad <= ALUOutM;
if(ForwardAD == 1'b0)
cad <= RFRD1;
end
endmodule
