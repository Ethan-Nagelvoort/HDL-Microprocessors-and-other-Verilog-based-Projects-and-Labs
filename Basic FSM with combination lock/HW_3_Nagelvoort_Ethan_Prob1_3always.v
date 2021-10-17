`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ethan
// 
// Create Date: 03/18/2020 10:45:54 PM
// Design Name: 
// Module Name: HW_3_Nagelvoort_Ethan_Prob1_3always
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

//using three always
//s0=000
//s1=001
//s2=010
//s3=011
//s4=100
//s5=101
module HW_3_Nagelvoort_Ethan_Prob1_3always(input CLK,RST,x,x1, output reg y);
reg[2:0] currentState;//states have 3 bits
reg[2:0] nextState;
always @ (posedge CLK or negedge RST) begin

if(RST==0)//active low reset
nextState<=3'b000;
else
currentState<=nextState;
end

always@(*) begin 

case(currentState)
3'b000: begin //s0
if(x==1'b1)
nextState = 3'b001;
else 
nextState = 3'b000;
end

3'b001:begin //s1
if(x1==1'b1)
nextState=3'b010;
else
nextState=3'b001;
end

3'b010:begin //s2
if(x==1'b1)
nextState=3'b011;
else
nextState=3'b010;
end

3'b011:begin //s3
if(x1==1'b1)
nextState=3'b100;
else
nextState=3'b011;
end

3'b100:begin//s4
if(x1==1'b1)
nextState=3'b101;
else
nextState=3'b100;
end

3'b101 : begin //s5
nextState = 3'b000;
end
endcase
end

always@(*) begin//this always is for the outputs/y

if(currentState!=3'b101)//only time y=1 is when currentState = s5
y=1'b0;
else
y=1'b1;
end

endmodule
