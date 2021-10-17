`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2020 03:51:12 AM
// Design Name: 
// Module Name: RTDmux
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


module RTDmux(
input [4:0]rt, 
    rd, 
   input RFDSel,
    output reg [4:0] rtd
    );
    
always @(*)
begin
    if(RFDSel == 1'b0)
        rtd = rt;
    else if(RFDSel == 1'b1)
        rtd = rd;
    else if(RFDSel == 1'bx)
        rtd = rtd;
    end
endmodule