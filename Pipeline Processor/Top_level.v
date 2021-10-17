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


module Top_level(input CLK, rst, output [4:0] RFRA1out, RFRA2out,
output [31:0] RFRD1out, RFRD2out, DMAout, DMRDout, allout);
wire [5:0] opcode;
wire [4:0] rs;
wire [4:0] rt, rtD;
wire [15:0] imm, simmE;
wire [31:0] inst;
wire [31:0] PCOut; 
wire [31:0] PCNow;
wire [31:0] ALUIn1, RFRD1, RFRD2;
wire [31:0] ALUIn2;
wire [31:0] ALUmux1;
wire [31:0] ALUmux2;
wire [3:0] ALUsel, ALUselE;
wire zero;
wire [31:0] ALUOut;
wire [31:0] DMOut, s, cbd, cad; 
wire MtoRFSel, MtoRFSelE;
wire RFDSel, RFDSelE;
wire [3:0] ALUInSel, ALUInSelE;
wire Branch, BranchE;
wire Jump;
wire RFWE, RFWEE, ForwardBD, ForwardAD; 
wire DMWE, DMWEE;
wire [1:0] ALUOp, ForwardBE, ForwardAE;
wire [31:0] DMdin;
wire [4:0] shamt;
wire [5:0] funct;
wire [4:0] rd, rdD;
wire [31:0] ALUDM;
wire [4:0] rtd;
wire [31:0] PCC, BEout, RFRD1E;
wire Zero, equal, Stall, Flush;
wire PCsel;
wire [31:0] PCnew;
//wire [31:0] PCC;
wire [25:0] Jaddr;
wire [31:0] PCJump;
wire [31:0] PCC2;
wire [31:0] IMRD;
wire [31:0] PCp1F;
wire [31:0] PCp1E;
wire [31:0] PCBranchM;
wire [31:0] DMdinM;
wire [31:0] ALUOutM, RFRD2BE;
wire [4:0] rdE, rtE, rsE;
wire [31:0] ALUOutW, DMOutW;
wire [4:0] rtdW, rtdE, rtdM;

jumpmux DUT16 (.PCJump(PCJump), .Jump(Jump), .PCC(PCC), .PCC2(PCC2));

PCsel DUT13 (.Branch(Branch), .Zero(equal), .PCsel(PCsel));

adder2 DUT14 (.simm(ALUmux2), .PCNow(PCp1E), .PCnew(PCnew));

PCmux DUT15 (.PCnew(PCBranchM), .PCNow(PCp1F), .PCsel(PCsel), .PCC(PCC)); 

PC DUT (.CLK(CLK), .PCOut(PCOut), .PCC(PCC2), .rst(rst), .Stall(Stall));

adder DUT2 (.PCOut(PCOut), .PCNow(PCp1F));

IM DUT3 (.IMA(PCOut), .IMRD(IMRD));

//F to D register
R1 DUT17 (.CLK(CLK), .IMRD(IMRD),.instrD(inst), .PCp1F(PCp1F), .PCp1D(PCNow), .Stall(Stall), .CLR(PCsel));  

assign opcode = inst [31:26];
assign rs = inst [25:21];
assign rt = inst [20:16];
assign imm = inst [15:0];
assign funct = inst [5:0];
assign shamt = inst[10:6];
assign rd = inst[15:11];
assign Jaddr = inst[25:0];
assign PCJump = {PCOut[31:26], Jaddr};



Register_File DUT4 (.RFRA1(rs), .RFRA2(rt), .RFWD(ALUDM), .RFRD1(RFRD1), .RFWE(RFWEW), .CLK(CLK), .RFRD2(RFRD2), .RFWA(rtdW));


//D to E register
R2 DUT19 (.CLK(CLK),.MtoRFSel(MtoRFSel), .RFDSel(RFDSel), .rs(rs), .rsE(rsE), .ALUInSel(ALUInSel), .ALUsel(ALUsel), .Branch(Branch),  .RFWE(RFWE), .DMWE(DMWE), 
.rt(rt), .rd(rd), .simm(s), .PCp1D(PCNow), .PCp1E(PCp1E), .RFRD1(RFRD1), .RFRD2(RFRD2), .RFRD1E(RFRD1E), .RFRD2E(RFRD2BE), .rtE(rtE),
.rdE(rdE), .simmE(ALUmux2), .MtoRFSelE(MtoRFSelE), .RFDSelE(RFDSelE), .ALUInSelE(ALUInSelE), .ALUselE(ALUselE), .BranchE(BranchE),  .RFWEE(RFWEE), .DMWEE(DMWEE), .CLR(Flush) );

//assign ALUmux1 = DMdin;
//assign BEout = DMdin;
SE DUT5 (.imm(imm), .simm(s));

ALUmux DUT10 (.RFRD2(BEout), .simm(ALUmux2), .ALUInSel(ALUInSelE), .ALUIn2(ALUIn2));

ALU DUT6 (.ALUIn1(ALUIn1), .ALUIn2(ALUIn2), .ALUsel(ALUselE), .ALUOut(ALUOut), .shamt(shamt), .Zero(Zero));

//E to M register
R3 DUT20 ( .CLK(CLK), .RFWEE(RFWEE), .rtdE(rtdE), .RFWEM(RFWEM), .MtoRFSelE(MtoRFSelE), .MtoRFSelM(MtoRFSelM), .DMWEE(DMWEE), .BranchE(BranchE), .ZeroE(Zero), .ALUOutE(ALUOut), .DMdinE(BEout), .PCBranchE(PCnew), .DMWEM(DMWEM), .BranchM(BranchM), .ZeroM(ZeroM), .ALUOutM(ALUOutM), .DMdinM(DMdinM), .PCBranchM(PCBranchM), .rtdM(rtdM));

DM DUT7 (.DMA(ALUOutM), .CLK(CLK), .DMRD(DMOut), .DMWD(DMdinM), .DMWE(DMWEM));

ALUDM DUT11 (.ALUOut(ALUOutW), .DMOut(DMOutW), .MtoRFSel(MtoRFSelW), .ALUDM(ALUDM));

Control_Unit DUT8 (.opcode(opcode), .MtoRFSel(MtoRFSel), .RFDSel(RFDSel), .ALUInSel(ALUInSel), .Branch(Branch), .Jump(Jump), .RFWE(RFWE), .DMWE(DMWE), .ALUOp(ALUOp));

ALU_decoder DUT9 (.funct(funct), .ALUOp(ALUOp), .ALUsel(ALUsel));

RTDmux DUT12 (.rt(rtE), .rd(rdE), .RFDSel(RFDSelE), .rtd(rtdE));

//M to W register
R4 DUT21 ( .CLK(CLK), .RFWEM(RFWEM), .MtoRFSelM(MtoRFSelM), .ALUOutM(ALUOutM), .rtdM(rtdM), .RD(DMOut), .RFWEW(RFWEW), .MtoRFSelW(MtoRFSelW), .ALUOutW(ALUOutW), .DMOutW(DMOutW), .rtdW(rtdW));

ForBEmux DUT22 (.ForwardBE(ForwardBE), .RFRD2E(RFRD2BE), .ALUOutM(ALUOutM), .ALUDM(ALUDM), .out(BEout));

ForAEmux DUT23 (.ForwardAE(ForwardAE), .ALUOutM(ALUOutM), .ALUDM(ALUDM), .RFRD1E(RFRD1E), .out(ALUIn1));

BDmux DUT24 (.ALUOutM(ALUOutM), .RFRD2(RFRD2), .ForwardBD(ForwardBD), .cbd(cbd));

ADmux DUT25 (.ALUOutM(ALUOutM), .RFRD1(RFRD1), .ForwardAD(ForwardAD), .cad(cad));

comparator DUT26 (.cbd(cbd), .cad(cad), .equal(equal));
//rsD, rsE, rtD, rtE, rtdE, rtdM, rtdW,
HazardUnit DUT27 (.Stall(Stall), .Flush(Flush), .ForwardAE(ForwardAE), .ForwardBE(ForwardBE), .ForwardAD(ForwardAD), .ForwardBD(ForwardBD),
.BranchD(Branch), .MtoRFSelE(MtoRFSelE), .RFWEE(RFWEE), .RFWEM(RFWEM), .RFWEW(RFWEW), .MtoRFSelM(MtoRFSelM), 
.rsD(rs), .rsE(rsE), .rtD(rt), .rtE(rtE), .rtdE(rtdE), .rtdM(rtdM), .rtdW(rtdW));

assign RFRA1out = rs;
assign RFRA2out= rt;
assign RFRD1out = ALUIn1;
assign RFRD2out = BEout;
assign DMAout = ALUOut;
assign DMRDout = DMOut;
assign allout = ALUIn2;
endmodule
