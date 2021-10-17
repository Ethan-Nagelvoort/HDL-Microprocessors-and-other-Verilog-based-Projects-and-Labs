`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2020 06:38:30 PM
// Design Name: 
// Module Name: HW4_1B_top_level_Nagelvoort_Ethan
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

module HW4_1B_top_level_Nagelvoort_Ethan #(parameter WLx = 6, WLa = 2, WLb = 3, WLc = 4,
 WLmul = WLx + WLa, 
 WLadd = (WLmul > WLb) ? WLmul + 1 : WLb + 1,//if WLmul is bigger than WLb, WLadd is WLmul+1.
 //if WLb is bigger than WLmul, WLadd is WLb+1
 WLout = WLadd + WLc)
 (input CLK, RST,
 input signed [WLx - 1 : 0] x,
 input signed [WLa - 1 : 0] a,
 input signed [WLb - 1 : 0] b,
 input signed [WLc - 1 : 0] c,
 output signed [WLout - 1 : 0] out);//final output
 //use wires to connect the modules, as in have one modules output be the input for another
 wire signed [WLmul - 1 : 0] outmul, mul;
 wire signed [WLadd - 1 : 0] outadd, add;
 wire signed [WLout - 1 : 0] outmul2;
 //instantiate the different modules 
 //once it goes through an adder or multiplier,
 //use a d flip flop to have it occur at posedge CLK
 //instantiate modules in the order of the given circuit
 HW4_1B_mult_Nagelvoort_Ethan #(.WLin1(WLx), .WLin2(WLa))
 mulR1 (.in1(x), .in2(a), .out(outmul));
 
 HW4_1B_dff_Nagelvoort_Ethan #(.WL(WLmul))
 d1 (.CLK(CLK), .RST(RST),.d(outmul), .q(mul));
 
 HW4_1B_adder_Nagelvoort_Ethan #(.WLin1(WLmul), .WLin2(WLb))
 addR (.in1(mul), .in2(b), .out(outadd));
 
 HW4_1B_dff_Nagelvoort_Ethan #(.WL(WLadd))
 d2 (.CLK(CLK), .RST(RST),.d(outadd), .q(add));
 
 HW4_1B_mult_Nagelvoort_Ethan #(.WLin1(WLadd), .WLin2(WLc))
 mulR2 (.in1(add), .in2(c), .out(outmul2));
 
 HW4_1B_dff_Nagelvoort_Ethan #(.WL(WLout))
 d3 (.CLK(CLK), .RST(RST),.d(outmul2), .q(out));
endmodule
