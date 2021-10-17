`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 09:10:20 PM
// Design Name: 
// Module Name: ForBEmux
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


module ForBEmux(input [1:0] ForwardBE, 
input [31:0] ALUOutM, ALUDM, RFRD2E,
output reg [31:0] out
    );
 always@(*) begin
 if(ForwardBE == 2'b00)
 out <= RFRD2E;
 if(ForwardBE == 2'b01)
 out <= ALUDM;
 if(ForwardBE == 2'b10)
 out <= ALUOutM;
end
endmodule
