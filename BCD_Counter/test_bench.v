`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2021 02:06:43 PM
// Design Name: 
// Module Name: test_bench
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


module test_bench #(parameter N=4);
reg clk, rst;
wire bit0, bit1, bit2, bit3;
wire [N-1:0] BCD_output_one_to_fifteen;
Top_module dut (.clk(clk), .rst(rst), .bit0(bit0), .bit1(bit1), .bit2(bit2), .bit3(bit3), .fullNum(BCD_output_one_to_fifteen));
initial begin 
clk <= 1;
forever #10 clk <= ~clk;
end 
initial begin
rst = 1;
#10
rst = 0;
#1000
$stop;
end
endmodule
