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
Top_level DUT (.all(all), .CLK(CLK), .RFRA1(RFRA1), .RFRD1(RFRD1), .DMA(DMA), .DMRD(DMRD), .rst(rst), .RFRA2(RFRA2), .RFRD2(RFRD2) );
initial begin
CLK <=1;
forever #5 CLK <= ~CLK;
end
initial begin
rst = 1;
#10
rst = 0;
#400


$stop;
end

endmodule
