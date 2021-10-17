`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2020 01:13:39 PM
// Design Name: 
// Module Name: HW4_1C_Nagelvoort_Ethan
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


module HW4_1C_Nagelvoort_Ethan #(parameter WLx = 6, WLa = 2, WLb = 3, WLc = 4, //sizes of x,a,b,c
 WLmul = WLx + WLa, //size of mulR1
 WLadd = (WLmul > WLb) ? WLmul + 1 : WLb +1, //size of addR
 WLmul2 = WLadd + WLx, //size of mulR2
 WLout = (WLmul2 > WLc) ? WLmul2 + 1 : WLc +1)//size of out
 (input CLK, RST,
 input signed [WLx - 1 : 0] x,
 input signed [WLa - 1 : 0] a,
 input signed [WLb - 1 : 0] b,
 input signed [WLc - 1 : 0] c,
 output reg signed [WLout - 1 : 0] out);

 reg signed [WLmul - 1 : 0] mulR1;
 reg signed [WLadd - 1 : 0] addR;
 reg signed [WLmul2 - 1 : 0] mulR2;

 always @(posedge CLK) begin
 if(RST == 1'b1) begin //if rst is active, all regs are 0
 out <= 0; 
 mulR1 <= 0;
 addR <= 0;
 mulR2<= 0;
 end
 else begin //if rst isn't zero proceed with the operations presented in the circuit
 mulR1 <= x * a;
 addR <= mulR1 + b;
 mulR2 <= addR * x;
 out <= mulR2 + c;
 end
 end
endmodule