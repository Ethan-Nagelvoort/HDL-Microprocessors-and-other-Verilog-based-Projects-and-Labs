`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 03:06:12 PM
// Design Name: 
// Module Name: top_level
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


module top_level(input CLK, rst, output t, en, z, output [31:0] p, output [31:0] pp, out, instr, BB, output[1:0] all, output [5:0] stt, output[5:0] opop);
wire [5:0] opcode;
wire [5:0] funct;
wire [4:0] rs;
wire [4:0] shamt;
wire [4:0] rt;
wire [4:0] rd;
wire [15:0] imm;
wire [31:0] inst; 
wire [31:0] Adr;
wire [5:0] st;
wire [31:0] MRD;
wire MWE;
wire [31:0] B;
wire IRWEn;
wire [31:0] DR;
wire MtoRFSel;
wire [31:0] ALUOutR, ALUOutRR;
wire [31:0] RFWD;
wire [4:0] RFWA;
wire RFDSel; 
wire RFWE;
wire [31:0] RFRD1;
wire [31:0] RFRD2;
wire [31:0] A; 
wire ALUIn1Sel;
wire [1:0] ALUIn2Sel, ALUOp;
wire [3:0] ALUsel;
wire Branch, Zero, rega;
wire PCWE, IRWE;
wire PCEn;
wire [1:0] PCSel;
wire IDSel;
wire [31:0] ALUIn1, ALUIn2, ALUOut;
wire [31:0] PCC;
wire [31:0] PC;
wire [31:0] simm;
wire [25:0] Jaddr;
wire [31:0] PCJump;

MEM DUT (.MRA(Adr), .MRD(MRD), .MWE(MWE), .CLK(CLK), .MWD(B));

IR DUT2 (.MRD(MRD), .CLK(CLK), .EN(IRWE), .IR(inst));


assign opcode = inst [31:26];
assign rs = inst [25:21];
assign rt = inst [20:16];
assign imm = inst [15:0];
assign funct = inst [5:0];
assign shamt = inst[10:6];
assign rd = inst[15:11];
assign Jaddr = inst[25:0] + 511;

DR DUT3 (.CLK(CLK), .MRD(MRD), .DR(DR));

MtoRFSelMux DUT4 (.DR(DR), .MtoRFSel(MtoRFSel), .ALUOutR(ALUOutRR), .RFWD(RFWD));

RF DUT5 (.CLK(CLK), .RFWD(RFWD), .RFRA1(rs), .RFRA2(rt), .RFWA(RFWA), .RFRD1(RFRD1), .RFRD2(RFRD2), .RFWE(RFWE));

RFDSelMux DUT6 (.RFDSel(RFDSel), .rt(rt), .rd(rd), .RFWA(RFWA));

A DUT7 (.RFRD1(RFRD1), .RFRD2(RFRD2), .CLK(CLK), .A(A), .B(B));

ALUIn1Sel DUT8 (.ALUIn1Sel(ALUIn1Sel), .A(A), .PC(PC), .ALUIn1(ALUIn1));

Adr DUT9 (.IDSel(IDSel),.PC(PC), .ALUOutR(ALUOutRR), .Adr(Adr));

PC DUT10 (.PCC(PCC), .CLK(CLK), .rst(rst), .PCEn(PCEn), .PC(PC));

ALUIn2Sel DUT11 (.ALUIn2Sel(ALUIn2Sel) , .B(B), .ALUIn2(ALUIn2), .simm(simm));

SE DUT12 (.op(opcode), .imm(imm), .simm(simm));

ALU DUT13 (.ALUIn1(ALUIn1), .ALUIn2(ALUIn2), .ALUsel(ALUsel), .ALUOut(ALUOut), .Zero(Zero), .shamt(shamt));

And DUT14 (.Branch(Branch), .Zero(Zero), .rega(rega));

Or DUT15 (.PCWE(PCWE), .rega(rega), .PCEn(PCEn));

ALUOutR DUT16 (.CLK(CLK), .ALUOut(ALUOut), .ALUOutR(ALUOutRR));

assign PCJump = {ALUOut[31:26], Jaddr};

PCSelMux DUT17 (.PCSel(PCSel), .ALUOut(ALUOut), .ALUOutR(ALUOutRR), .PCC(PCC), .Jaddr(PCJump));

ALU_Decoder DUT18 (.funct(funct), .ALUOp(ALUOp), .ALUsel(ALUsel));

main_controller DUT19 (.st(st), .CLK(CLK), .op(opcode), .rst(rst), .MtoRFSel(MtoRFSel), .RFDSel(RFDSel), .IDSel(IDSel), .PCSel(PCSel), .ALUIn2Sel(ALUIn2Sel), .ALUIn1Sel(ALUIn1Sel), .IRWE(IRWE), .MWE(MWE), .PCWE(PCWE), .Branch(Branch), .RFWE(RFWE), .ALUop(ALUOp));
//mc2 DUT19 (.st(st), .CLK(CLK), .op(opcode), .rst(rst), .MtoRFSel(MtoRFSel), .RFDSel(RFDSel), .IDSel(IDSel), .PCSel(PCSel), .ALUIn2Sel(ALUIn2Sel), .ALUIn1Sel(ALUIn1Sel), .IRWE(IRWE), .MWE(MWE), .PCWE(PCWE), .Branch(Branch), .RFWE(RFWE), .ALUop(ALUOp));
assign t = RFWE;
assign p = PC;
assign pp = PCC;
assign en = PCWE;
assign out = ALUOut;
assign instr = inst;
assign BB = B;
assign all = ALUIn2Sel;
assign stt = st;
assign opop = opcode;
assign z = Zero;
endmodule
