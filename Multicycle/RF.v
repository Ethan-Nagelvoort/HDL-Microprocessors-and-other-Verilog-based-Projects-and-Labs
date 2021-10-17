`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 12:14:04 PM
// Design Name: 
// Module Name: RF
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


module RF #(parameter AWL = 5, DWL = 32)
                      (input CLK, RFWE, input unsigned [AWL-1:0] RFRA1, RFRA2, RFWA,
                       output [DWL-1:0] RFRD1, RFRD2,
                       input [DWL-1:0] RFWD);                 
reg [DWL-1:0] mem[31:0];
initial $readmemb("RF.txt", mem);
always @(posedge CLK) begin
  if(RFWE) mem[RFWA] <= RFWD;//if RFWE high then write RFWD into mem at address RFWA
  end
 assign RFRD1 = mem[RFRA1];
 assign RFRD2 = mem[RFRA2];
 endmodule


