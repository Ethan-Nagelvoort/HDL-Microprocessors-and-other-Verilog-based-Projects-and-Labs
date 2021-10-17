`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2020 02:33:35 PM
// Design Name: 
// Module Name: HW4_1A_Nagelvoort_Ethan
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


module HW4_1A_Nagelvoort_Ethan 
#(parameter WLx = 8, //sizes of x,a,b,c
 WLa = 3, 
 WLb = 4, 
 WLc = 5,
 WLregm = WLx + WLa,//size of x*a
 WLrega = (WLregm > WLb) ? WLregm + 1 : WLb + 1,//if WLregm is greater than WLb then WLrega = WLregm + 1, if not then it equals WLb+1
 //size of regm+b
 WLout = WLrega + WLc)//size of rega * c
 (input CLK, RST,
 input signed [WLx - 1 : 0] x,
 input signed [WLa - 1 : 0] a,
 input signed [WLb - 1 : 0] b,
 input signed [WLc - 1 : 0] c,
 output reg  signed [WLout - 1 : 0] out);
 reg  signed [WLregm - 1 : 0] regm; //register for multiplication
 reg  signed [WLrega - 1 : 0] rega; //register for addition
 always @(posedge CLK) begin
 if(RST==1'b1) begin // use <= cause this is a sequential circuit
 out <= 0; //set all regs to 0 if reset is active
 regm <= 0;
 rega<=0;
 end
 else begin
 regm <= x * a; //regm = x*a
 rega <= regm + b;//rega = mulR + b
 out <= rega * c; // out = addR * c
 end
 end
endmodule

