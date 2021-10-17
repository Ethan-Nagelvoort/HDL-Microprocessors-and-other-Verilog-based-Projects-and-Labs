`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 06:27:52 PM
// Design Name: 
// Module Name: ALU_Decoder
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


module ALU_Decoder(funct, ALUOp, ALUsel);
input [5:0] funct;
input [1:0] ALUOp;
output reg [3:0] ALUsel;

always @(*)
begin
    case(ALUOp)
    2'b00: begin//LW or SW
        ALUsel <= 4'b0010;
        end
    2'b01: begin//Beq
        ALUsel <= 4'b0110;
        end
    2'b10: begin // ALUOp = 1x
        case(funct)
            6'b100100: ALUsel <= 4'b0000;//logical and
            6'b100101: ALUsel <= 4'b0001;//logical or
            6'b100000: ALUsel <= 4'b0010;//add
            6'b000000: ALUsel <= 4'b0011;//SLL
            6'b000010: ALUsel <= 4'b0100;//SRL
            6'b000011: ALUsel <= 4'b0101;//SRA
            6'b100010: ALUsel <= 4'b0110;//SUB
            6'b101010: ALUsel <= 4'b0111;//SLT
            6'b000100: ALUsel <= 4'b1000;//SLLV
            6'b000110: ALUsel <= 4'b1001;//SRLV
            6'b000111: ALUsel <= 4'b1010;//SRAV
            6'b011000: ALUsel <= 4'b1011;//mult
        endcase
        end
     endcase
    end
endmodule


