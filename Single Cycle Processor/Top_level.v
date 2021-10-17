`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 05:03:24 PM
// Design Name: 
// Module Name: Top_level
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


module Top_level(input CLK, rst, output [4:0] RFRA1, RFRA2,
output [31:0] RFRD1, RFRD2, DMA, DMRD, all);
wire [5:0] opcode;
wire [4:0] rs;
wire [4:0] rt;
wire [15:0] imm;
wire [31:0] inst;
wire [31:0] PCOut; 
wire [31:0] PCNow;
wire [31:0] ALUIn1;
wire [31:0] ALUIn2;
wire [31:0] ALUmux1;
wire [31:0] ALUmux2;
wire [3:0] ALUsel;
wire zero;
wire [31:0] ALUOut;
wire [31:0] DMOut; 
wire MtoRFSel;
wire RFDSel;
wire [3:0] ALUInSel;
wire Branch;
wire Jump;
wire RFWE; 
wire DMWE;
wire [1:0] ALUOp;
wire [31:0] DMdin;
wire [4:0] shamt;
wire [5:0] funct;
wire [4:0] rd;
wire [31:0] ALUDM;
wire [4:0] rtd;
wire [31:0] PCC;
wire Zero;
wire PCsel;
wire [31:0] PCnew;
wire [31:0] PCC;
wire [25:0] Jaddr;
wire [31:0] PCJump;
wire [31:0] PCC2;

jumpmux DUT16 (.PCJump(PCJump), .Jump(Jump), .PCC(PCC), .PCC2(PCC2));

PCsel DUT13 (.Branch(Branch), .Zero(Zero), .PCsel(PCsel));

adder2 DUT14 (.simm(ALUmux2), .PCNow(PCNow), .PCnew(PCnew));

PCmux DUT15 (.PCnew(PCnew), .PCNow(PCNow), .PCsel(PCsel), .PCC(PCC)); 

PC DUT (.CLK(CLK), .PCOut(PCOut), .PCC(PCC2), .rst(rst));

adder DUT2 (.PCOut(PCOut), .PCNow(PCNow));

IM DUT3 (.IMA(PCOut), .IMRD(inst));


assign opcode = inst [31:26];
assign rs = inst [25:21];
assign rt = inst [20:16];
assign imm = inst [15:0];
assign funct = inst [5:0];
assign shamt = inst[10:6];
assign rd = inst[15:11];
assign Jaddr = inst[25:0];
assign PCJump = {PCOut[31:26], Jaddr};

Register_File DUT4 (.RFRA1(rs), .RFRA2(rt), .RFWD(ALUDM), .RFRD1(ALUIn1), .RFWE(RFWE), .CLK(CLK), .RFRD2(DMdin), .RFWA(rtd));

assign ALUmux1 = DMdin;

SE DUT5 (.imm(imm), .simm(ALUmux2));

ALUmux DUT10 (.RFRD2(ALUmux1), .simm(ALUmux2), .ALUInSel(ALUInSel), .ALUIn2(ALUIn2));

ALU DUT6 (.ALUIn1(ALUIn1), .ALUIn2(ALUIn2), .ALUsel(ALUsel), .ALUOut(ALUOut), .shamt(shamt), .Zero(Zero));

DM DUT7 (.DMA(ALUOut), .CLK(CLK), .DMRD(DMOut), .DMWD(DMdin), .DMWE(DMWE));

ALUDM DUT11 (.ALUOut(ALUOut), .DMOut(DMOut), .MtoRFSel(MtoRFSel), .ALUDM(ALUDM));

Control_Unit DUT8 (.opcode(opcode), .MtoRFSel(MtoRFSel), .RFDSel(RFDSel), .ALUInSel(ALUInSel), .Branch(Branch), .Jump(Jump), .RFWE(RFWE), .DMWE(DMWE), .ALUOp(ALUOp));

ALU_decoder DUT9 (.funct(funct), .ALUOp(ALUOp), .ALUsel(ALUsel));

RTDmux DUT12 (.rt(rt), .rd(rd), .RFDSel(RFDSel), .rtd(rtd));

assign RFRA1 = rs;
assign RFRA2 = rt;
assign RFRD1 = ALUIn1;
assign RFRD2 = ALUmux1;
assign DMA = ALUOut;
assign DMRD = DMOut;
assign all = ALUIn2;
endmodule
