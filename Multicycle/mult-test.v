`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2020 02:28:58 PM
// Design Name: 
// Module Name: mult-test
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


module multtest;
reg CLK, rst;
wire t, en, z;
wire [31:0] p, pp, out, instr, BB;
wire [1:0] all;
wire [5:0] stt;
wire [5:0] opop;
top_level DUT (.z(z), .opop(opop), .CLK(CLK), .rst(rst),.t(t), .p(p), .pp(pp), .en(en), .out(out), .instr(instr), .BB(BB), .all(all), .stt(stt));
initial begin
CLK <=1;
forever #5 CLK <= ~CLK;
end
initial begin
rst <= 1;
#10
rst <= 0;
//#1000
#1000

$stop;
end

endmodule

