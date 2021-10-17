`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2020 06:28:14 PM
// Design Name: 
// Module Name: HW4_1B_dff_Nagelvoort_Ethan
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
//d flip flop
module HW4_1B_dff_Nagelvoort_Ethan #(parameter WL = 2)
 (input CLK, RST,
 input [WL - 1 : 0] d,
 output reg [WL - 1 : 0] q);
 always @(posedge CLK) begin
 if(RST==1'b1)begin
  q <= 0; end
 else begin
 q <= d; end
 end
endmodule