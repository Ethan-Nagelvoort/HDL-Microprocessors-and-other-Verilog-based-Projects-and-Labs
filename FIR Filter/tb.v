`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 12:12:05 AM
// Design Name: 
// Module Name: tb
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


module tb;
parameter w=32;
reg CLK, rst, rst2 ,CLK2; 
reg [16-1:0] h0, h1, h2, x;
reg [32-1:0] v;
wire [w-1:0] y; 

Top DUT (.CLK(CLK), .CLK2(CLK2), .rst(rst), .rst2(rst2), .h0(h0), .h1(h1), .h2(h2), .x(x), .y(y));

initial begin 
CLK2 <= 1;
forever #10 CLK2 <= ~CLK2;
end 
initial begin
rst<=1;
rst2 <=1;
h0 <= -3;
h1 <= 3;
h2 <= 5;
x <= -1;
#10
rst <=0;
rst2<=0;
x<=-2;
#10
x<=3;
#10
x<=4;
#10
x<=-5;
#10
x<=1;
#10
x<=0;
#10
x<=3;
#10
x<=4;
#10
x<=1;
#10
x<=2;
#10
x<=3;
#10
x<=4;
#10
x<=2;
#10
x<=-1;
#10
x<=3;
#10
x<=2;
#10
x<=6;
#10
x<=1;
#10
x<=-1;
#10
x<=7;
#40
$stop;
end
endmodule



