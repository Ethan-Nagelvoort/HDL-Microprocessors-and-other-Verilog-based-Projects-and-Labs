`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 03:54:47 PM
// Design Name: 
// Module Name: R3
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


module R3
#(parameter DWL = 32)
    (
    input CLK, RFWEE, MtoRFSelE, DMWEE, BranchE, ZeroE, 
    input [4:0] rtdE, 
    input [DWL-1:0] ALUOutE, DMdinE, PCBranchE,
    output reg RFWEM, MtoRFSelM, DMWEM, BranchM, ZeroM, 
    output reg [4:0] rtdM, 
    output reg [DWL-1:0] ALUOutM, DMdinM, PCBranchM
    );
   
    //Update Execute to Memory Lines
    always @(posedge CLK) begin
        RFWEM <= RFWEE; //Register File Write Enable, Execute -> Write
        MtoRFSelM <= MtoRFSelE; //Memory to Register File Sel., Execute -> Write
        DMWEM <= DMWEE; //Data Memory Write Enabled, Execute -> Write
        BranchM <= BranchE; //Branch, Execute -> Write
        ZeroM <= ZeroE; //Zero Flag, Execute -> Write
        ALUOutM <= ALUOutE; //ALU Output (32-bit), Execute -> Write
        DMdinM <= DMdinE; //Data Memory, Execute -> Write
        rtdM <= rtdE; //Target and Destination Registers, Execute -> Write
        PCBranchM <= PCBranchE; //Program Counter Branch, Execute -> Write
    end
endmodule

