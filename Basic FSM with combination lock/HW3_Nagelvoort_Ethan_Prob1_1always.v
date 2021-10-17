`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ethan 
// 
// Create Date: 03/18/2020 08:50:11 PM
// Design Name: 
// Module Name: HW3_Nagelvoort_Ethan_Prob1_1always
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

//using one always
//s0=000
//s1=001
//s2=010
//s3=011
//s4=100
//s5=101
module HW3_Nagelvoort_Ethan_Prob1_1always(input CLK,RST,x,x1, output reg y);
wire[2:0] currentState;//states are 3 bits long
reg[2:0] nextState;
always@(posedge CLK or negedge RST) begin

if(RST==0)//active low reset
nextState <= 3'b000;

else begin

case(currentState)//can see where values for y,x,x1 come from from graph in other question

3'b000:begin //currently at s0
y = 1'b0;
if(x == 1'b1)
nextState = 3'b001;
else
nextState = 3'b000;
end

3'b001:begin//s1
y=1'b0;
if(x1==1'b1)
nextState = 3'b010;
else
nextState = 3'b001;
end

3'b010:begin //s2
y=1'b0;
if(x==1'b1)
nextState=3'b011;
else
nextState=3'b010;
end

3'b011:begin//s3
y=1'b0;
if(x1==1'b1)
nextState = 3'b100;
else
nextState = 3'b011;
end

3'b100:begin // s4
y=1'b0;
if(x1 == 1'b1)
nextState = 3'b101;
else
nextState = 3'b100;
end

3'b101:begin // s5
y=1'b1;
nextState = 3'b000;//nextState goes to s0 in any input condition
end
endcase
end
end

assign currentState = nextState;//have current state = next state for the next cycle
endmodule
