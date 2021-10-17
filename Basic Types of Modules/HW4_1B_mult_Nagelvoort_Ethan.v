`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2020 06:17:28 PM
// Design Name: 
// Module Name: HW4_1B_mult_Nagelvoort_Ethan
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
module HW4_1B_mult_Nagelvoort_Ethan #(parameter WLin1 = 2, WLin2 = 2,
 WLout = WLin1 + WLin2)
 (input signed [WLin1 - 1 : 0] in1,
 input signed [WLin2 - 1 : 0] in2,
 output signed [WLout - 1 : 0] out);
 assign out = in1 * in2;//output is the product of the two inputs
endmodule
