`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 08:49:51 PM
// Design Name: 
// Module Name: main_controller
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


module main_controller(input [5:0] op, input rst, CLK, output reg IDSel, MWE, IRWE, 
RFDSel, MtoRFSel, RFWE, ALUIn1Sel, Branch, PCWE, output reg [1:0] ALUIn2Sel, PCSel, ALUop, output reg [5:0] st);
parameter s0 = 4'b0000;
parameter s1 = 4'b0001;
parameter s2 = 4'b0010;
parameter s3 = 4'b0011;
parameter s4 = 4'b0100;
parameter s5 = 4'b0101;
parameter s6 = 4'b0110;
parameter s7 = 4'b0111;
parameter s8 = 4'b1000;
parameter s9 = 4'b1001;
parameter s10 = 4'b1010;
parameter s11 = 4'b1011;
reg [3:0] state;
always@(posedge CLK)begin
if (rst == 1)begin
state<=s0;
end
else begin
case(state)

s0:begin
state <= s1;
IDSel <= 0;
ALUIn1Sel <= 0;
ALUIn2Sel <= 2'b01;
ALUop <= 2'b00;
PCSel <= 2'b00;
IRWE <= 1'b1;
PCWE <= 1'b1;
state <= s1;
MtoRFSel <= 1'bx;
RFDSel <= 1'bx;
MWE <= 0;
Branch <= 0;
RFWE <= 0;
st <= state;
end

s1:begin
PCWE <= 0;
ALUIn1Sel <= 0;
ALUIn2Sel <= 2'b10;
ALUop <= 2'b00;
IDSel <= 1'bx;
PCSel <= 2'bxx;
IRWE <= 0;
MtoRFSel <= 1'bx;
RFDSel <= 1'bx;
MWE <= 0;
Branch <= 0;
RFWE <= 0;
if(op == 6'b000000)begin // rtype
state <= s6;end
if(op == 6'b100011 || op == 6'b101011)// lw sw
state <= s2;
if(op == 6'b000100)//beq
state <= s8;
if(op == 6'b000010)//j
state <= s9;
if(op == 6'b001000)//addi
state <= s10;
st <= state;
end

s2:begin
ALUIn1Sel = 1;
ALUIn2Sel = 2'b10;
ALUop = 2'b00;

IDSel <= 1'bx;
PCSel <= 2'bxx;
IRWE <= 0;
PCWE <= 0;
MtoRFSel <= 1'bx;
RFDSel <= 1'bx;
MWE <= 0;
Branch <= 0;
RFWE <= 0;
if(op == 6'b100011)
state <= s3;
if(op == 6'b101011)
state <= s5;
if(op != 6'b100011 && op != 6'b101011)
state <= s1;
st <= state;
end

s3:begin
IDSel = 1;
state <= s4;

ALUIn1Sel <= 1'bx;
ALUIn2Sel <= 2'bxx;
ALUop <= 2'bxx;
PCSel <= 2'bxx;
IRWE <= 0;
PCWE <= 0;
MtoRFSel <= 1'bx;
RFDSel <= 1'bx;
MWE <= 0;
Branch <= 0;
RFWE <= 0;
st <= state;
end

s4:begin
RFDSel <= 0;
MtoRFSel <= 1;
RFWE <= 1;

IDSel <= 1'bx;
ALUIn1Sel <= 1'bx;
ALUIn2Sel <= 2'bxx;
ALUop <= 2'bxx;
PCSel <= 2'bxx;
IRWE <= 0;
PCWE <= 0;
MWE <= 0;
Branch <= 0;
state <= s0;
st <= state;
end

s5: begin
IDSel <= 1;
MWE <= 1;

ALUIn1Sel <= 1'bx;
ALUIn2Sel <= 2'bxx;
ALUop <= 2'bxx;
PCSel <= 2'bxx;
IRWE <= 0;
PCWE <= 0;
MtoRFSel <= 1'bx;
RFDSel <= 1'bx;
Branch <= 0;
RFWE <= 0;
state <= s0;
st <= state;
end

s6:begin
ALUIn1Sel <= 1;
ALUIn2Sel <= 2'b00;
ALUop <= 2'b10;

IDSel <= 1'bx;
PCSel <= 2'bxx;
IRWE <= 0;
PCWE <= 0;
MtoRFSel <= 1'bx;
RFDSel <= 1'bx;
MWE <= 0;
Branch <= 0;
RFWE <= 0;
if(op == 6'b101011)
state <= s2;
else
state <= s7;
st <= state;
end

s7:begin 
RFDSel = 1;
MtoRFSel = 0;
RFWE = 1;
state <= s0;

IDSel <= 1'bx;
ALUIn1Sel <= 1'bx;
ALUIn2Sel <= 2'bxx;
ALUop <= 2'bxx;
PCSel <= 2'bxx;
IRWE <= 0;
PCWE <= 0;
MWE <= 0;
Branch <= 0;
st <= state;
end

s8:begin
ALUIn1Sel <= 1;
ALUIn2Sel <= 2'b00;
ALUop <= 2'b01;
PCSel <= 2'b01;
Branch <= 1;
state <= s0;

IDSel <= 1'bx;
IRWE <= 0;
PCWE <= 0;
MtoRFSel <= 1'bx;
RFDSel <= 1'bx;
MWE <= 0;
RFWE <= 0;
st <= state;
end

s9:begin
PCSel <= 2'b10;
PCWE <= 1;
IDSel <= 1'bx;
ALUIn1Sel <= 1'bx;
ALUIn2Sel <= 2'bxx;
ALUop <= 2'bxx;
IRWE <= 0;
MtoRFSel <= 1'bx;
RFDSel <= 1'bx;
MWE <= 0;
Branch <= 0;
RFWE <= 0;
state <= s0;
st <= state;
end

s10: begin
ALUIn1Sel <= 1;
ALUIn2Sel <= 2'b10;
ALUop <= 2'b00;
IDSel <= 1'bx;
PCSel <= 2'bxx;
IRWE <= 0;
PCWE <= 0;
MtoRFSel <= 1'bx;
RFDSel <= 1'bx;
MWE <= 0;
Branch <= 0;
RFWE <= 0;
state <= s11;
st <= state;
end

s11:begin
RFDSel <= 0;
MtoRFSel <= 0;
RFWE <= 1;

IDSel <= 1'bx;
ALUIn1Sel <= 1'bx;
ALUIn2Sel <= 2'bxx;
ALUop <= 2'bxx;
PCSel <= 2'bxx;
IRWE <= 0;
PCWE <= 0;
MWE <= 0;
Branch <= 0;
state<= s0;
st <= state;
end
endcase
end
end



endmodule
