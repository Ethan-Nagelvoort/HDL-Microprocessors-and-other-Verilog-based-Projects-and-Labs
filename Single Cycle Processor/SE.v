`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 04:39:09 PM
// Design Name: 
// Module Name: SE
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


module SE( imm, simm);

input  [15:0] imm;
output [31:0] simm;

assign simm = {{16{imm[15]}}, imm};

endmodule


