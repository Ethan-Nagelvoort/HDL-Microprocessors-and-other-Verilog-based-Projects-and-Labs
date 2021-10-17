`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 04:53:05 PM
// Design Name: 
// Module Name: R4
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
`timescale 1ns / 1ps


module R4(
input CLK,
RFWEM,
MtoRFSelM,
input [31:0] RD,
ALUOutM,
input [4:0] rtdM,
output reg RFWEW,
MtoRFSelW,
output reg [31:0] DMOutW, 
output reg [31:0] ALUOutW,
output reg [4:0] rtdW   
);

always @(posedge CLK) begin
RFWEW <= RFWEM;
MtoRFSelW <= MtoRFSelM;
DMOutW <= RD;
ALUOutW <= ALUOutM;
rtdW <= rtdM;
end

endmodule
