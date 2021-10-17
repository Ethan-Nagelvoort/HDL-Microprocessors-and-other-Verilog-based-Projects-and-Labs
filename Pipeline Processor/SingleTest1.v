`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 10:04:18 PM
// Design Name: 
// Module Name: SingleTest1
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


module SingleTest1;
reg CLK, rst;
wire [4:0] RFRA1 , RFRA2;
wire [31:0] RFRD1, DMA, DMRD, RFRD2, all;
Top_level DUT (.allout(all), .CLK(CLK), .RFRA1out(RFRA1), .RFRD1out(RFRD1), .DMAout(DMA), .DMRDout(DMRD), .rst(rst), .RFRA2out(RFRA2), .RFRD2out(RFRD2) );
initial begin
CLK <=1;
forever #5 CLK <= ~CLK;
end
initial begin
rst = 1;
#10
rst = 0;
#540


$stop;
end

endmodule
