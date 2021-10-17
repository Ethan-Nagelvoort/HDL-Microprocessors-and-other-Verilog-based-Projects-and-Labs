`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2020 11:11:45 PM
// Design Name: 
// Module Name: HW3_Nagelvoort_Ethan_Prob2
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

//s0=00
//s1=01
//s2=11
module HW3_Nagelvoort_Ethan_Prob2(input CLK, RST, L, output reg P );
reg[1:0] currentState;//states are 2 bits
reg[1:0] nextState;
always@(posedge CLK) begin
if(RST==1)//active reset
currentState<=2'b00;
else
currentState<=nextState;
end

always@(*) begin
case(currentState)//the values of L,P can be found in the graph
2'b00:begin//s0, low input, waiting for rise
if(L==1)
nextState<=2'b01;
else
nextState<=2'b00;
P<=0;
end
2'b01:begin//s1, edge detected
if(L==1)
nextState<=2'b11;
else
nextState<=2'b00;
P<=1;
end
2'b11:begin//s2, high input, waiting for fall
if(L==1)
nextState<=2'b11;
else
nextState<=2'b00;
P<=0;
end
endcase
end
endmodule
