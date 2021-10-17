`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 02:05:41 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(opcode, MtoRFSel, RFDSel, ALUInSel, Branch, Jump, RFWE, DMWE, ALUOp);
input [5:0] opcode;
output reg MtoRFSel, RFDSel, ALUInSel, Branch, Jump, RFWE, DMWE;
output reg [1:0] ALUOp;

always@(*)
begin
    case(opcode)
    6'b100011: begin //lw
       MtoRFSel = 1'b1;
       RFDSel = 1'b0;
       ALUInSel = 1'b1;
       Branch = 1'b0;
       Jump = 1'b0;
       RFWE = 1'b1;
       DMWE = 1'b0;
       ALUOp = 2'b00; 
       end
    6'b101011: begin // sw
        MtoRFSel = 1'bx;
        RFDSel = 1'b0;
        ALUInSel = 1'b1;
        Jump = 1'b0;
        Branch = 1'b0;
        RFWE = 1'b0;
        DMWE = 1'b1;
        ALUOp = 2'b00;
        end
    6'b000000: begin //R-type instructions
        MtoRFSel = 1'b0;
        RFDSel = 1'b1;
        ALUInSel = 1'b0;
        Jump = 1'b0;
        Branch = 1'b0;
        RFWE = 1'b1;
        DMWE = 1'b0;
        ALUOp = 2'b10;
        end
     6'b001000: begin //addi
        MtoRFSel = 1'b0;
        RFDSel = 1'b0;
        ALUInSel = 1'b1;
        Jump = 1'b0;
        Branch = 1'b0;
        RFWE = 1'b1;
        DMWE = 1'b0;
        ALUOp = 2'b00;
        end
      6'b000010: begin // jump instruction
        MtoRFSel = 1'bx;
        RFDSel = 1'bx;
        ALUInSel = 1'bx;
        Jump = 1'b1;
        Branch = 1'bx;
        RFWE = 1'b0;
        DMWE = 1'b0;
        ALUOp = 2'bxx;
        end
       6'b000100: begin //beq
        MtoRFSel = 1'bx;
        RFDSel = 1'bx;
        ALUInSel = 1'b0;
        Jump = 1'b0;
        Branch = 1'b1;
        RFWE = 1'b0;
        DMWE = 1'b0;
        ALUOp = 2'b01;
        end
       6'b001000:begin//addi
        MtoRFSel = 1'b0;
        RFDSel = 1'b0;
        ALUInSel = 1'b1;
        Jump = 1'b0;
        Branch = 1'b0;
        RFWE = 1'b1;
        DMWE = 1'b0;
        ALUOp = 2'b00;
        end
        endcase
        end
endmodule
