`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2020 08:36:28 PM
// Design Name: 
// Module Name: HW4_tb_Nagelvoort_Ethan
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


module HW4_tb_Nagelvoort_Ethan;


parameter WLx = 6, WLa = 3, WLb = 3, WLc = 4,//sizes of x,a,b,c
//parameters meant to get the size for output 1
WLmul = WLx + WLa, 
WLadd = (WLmul > WLb) ? WLmul + 1 : WLb + 1, 
WLout =WLadd + WLc, 
WLmul1 = WLx + WLa, 
//parameters meant to get the size for output 2
WLadd2 = (WLmul1 > WLb) ? WLmul1 + 1 : WLb + 1,
WLmul2 = WLadd2 + WLx, 
WLout2 = (WLmul2 > WLc) ? WLmul2 + 1 : WLc + 1;
 reg CLK, RST;
 reg signed [WLx - 1 : 0] x;
 reg signed [WLa - 1 : 0] a;
 reg signed [WLb - 1 : 0] b;
 reg signed [WLc - 1 : 0] c;

 wire signed [WLout - 1 : 0] outA, outB;
 wire signed [WLout2 - 1 : 0] outC;


 //instantiate modules using DUT
 HW4_1A_Nagelvoort_Ethan  #(.WLx(WLx), .WLa(WLa), .WLb(WLb), .WLc(WLc))
 DUT (.CLK(CLK), .RST(RST), .x(x), .a(a), .b(b),.c(c), .out(outA));
 HW4_1B_top_level_Nagelvoort_Ethan #(.WLx(WLx), .WLa(WLa), .WLb(WLb), .WLc(WLc))
 DUT1 (.CLK(CLK), .RST(RST), .x(x), .a(a), .b(b),.c(c), .out(outB));
 HW4_1C_Nagelvoort_Ethan #(.WLx(WLx), .WLa(WLa), .WLb(WLb), .WLc(WLc))
 DUT2 (.CLK(CLK), .RST(RST), .x(x), .a(a), .b(b),.c(c), .out(outC));

initial CLK <= 1;
 always #1 CLK <= ~CLK;
 
 initial begin
 x <= 0;
 a <= -3;
 b <= 3;
 c <= -7;
 RST <= 1'b1;
 #10
 RST <= 1'b0;
 x <= -1;
 #10
 x <= 5;
 #10
 x <= 3;
 #10
 x <= 31;
 #10
 x <= -21;
 #10
 $stop;
 
 end
 
endmodule