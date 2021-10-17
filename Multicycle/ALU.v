`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 01:03:03 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter WL = 32, sel=4)
(input [WL-1:0] ALUIn1,ALUIn2,
input [4:0] shamt,//shift amount     
input [sel-1:0] ALUsel,
output reg signed [WL-1:0] ALUOut, 
output reg Zero); 
reg [WL-1:0] Result;
/*wire[WL:0] tmp;
assign tmp = ALUIn1 - ALUIn2; //detects if ALUIn1 and ALUIn2 are the same */
always @(*) begin
Zero <= 1'b0;
/*if(tmp==0) begin
Zero<=1'b1;
end
if(tmp!=0)begin
Zero<=1'b0;
end*/
    case (ALUsel)
    4'b0000: 
        Result <= ALUIn1 & ALUIn2; 
    4'b0001:
        Result <= ALUIn1 | ALUIn2;
    4'b0010:
        Result <= ALUIn1+ALUIn2;
    4'b0011:
        Result <= ALUIn2<<shamt; 
    4'b0100:
        Result <= ALUIn2>>shamt; 
    4'b0101:
        Result <= ALUIn2>>>shamt; 
    4'b0110: begin
        Result <= ALUIn1 - ALUIn2;
        if(Result == 0)
         Zero = 1'b1;
        end
    4'b0111: begin
        if(ALUIn1<ALUIn2)begin
           Result = 1;
           end
           else begin
           Result = 0;
           end
        end
    4'b1000:
        Result <= ALUIn2<<ALUIn1;
    4'b1001:
        Result <= ALUIn2>>ALUIn1;
    4'b1010:
        Result <= (ALUIn2>>>ALUIn1); 
    4'b1011: 
        Result <= ALUIn1*ALUIn2;
    default: 
        Result <= 32'h00000000;
    endcase
     ALUOut = Result;
    end 
endmodule
