`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2020 01:43:06 AM
// Design Name: 
// Module Name: test_bench2
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
//tests red light module

module test_bench2;
reg CLK, rst, w_leavingCars, e_leavingCars, 
n_leavingCars, s_leavingCars, w_leavingCarsL, e_leavingCarsL,
 n_leavingCarsL, s_leavingCarsL;
 reg [4:0] state1;
 wire w_red, e_red, s_red, n_red;
parameter [1:0] g = 2'b01; //green
parameter [1:0] y = 2'b10; // yellow
parameter [1:0] r = 2'b11; //red
parameter [4:0] n_s = 5'b00000; //north and south light
parameter [4:0] e_w = 5'b00001; // east and west light
parameter [4:0] n_s_y = 5'b00010;//north and south yellow light
parameter [4:0] e_w_y = 5'b00011;//east and west yellow light
parameter [4:0] n_nl = 5'b00100;//north and north left
parameter [4:0] n_nl_y = 5'b00101;//north and north left yellow
parameter [4:0] s_sl = 5'b00110;//south and south left
parameter [4:0] s_sl_y = 5'b00111;//south and south left yellow
parameter [4:0] w_wl = 5'b01000;//west and west left
parameter [4:0] w_wl_y = 5'b01001;//west and west left yellow
parameter [4:0] e_el = 5'b01010;//east and east left
parameter [4:0] e_el_y = 5'b01011;//east and east left yellow
parameter [4:0] sl_nl = 5'b01100;//south left and north left
parameter [4:0] sl_nl_y = 5'b01101;//south left and north left yellow
parameter [4:0] el_wl = 5'b01110;//east left and west left
parameter [4:0] el_wl_y = 5'b01111;//east left and west left yellow
//instantiate module
 red_light DUT3 (.CLK(CLK), .rst(rst), .w_leavingCars(w_leavingCars), .e_leavingCars(e_leavingCars), 
.n_leavingCars(n_leavingCars), .s_leavingCars(s_leavingCars), 
.w_leavingCarsL(w_leavingCarsL), .e_leavingCarsL(e_leavingCarsL),
.n_leavingCarsL(n_leavingCarsL), .s_leavingCarsL(s_leavingCarsL),
.state1(state1), .w_red(w_red), .n_red(n_red), .s_red(s_red), .e_red(e_red));

initial begin
CLK <= 1;
forever #10 CLK <= ~CLK;
 end
 initial
 begin 
 rst<= 1'b1;
 #10
 rst<=1'b0;
state1 <= n_s;
 n_leavingCars<=1'b1;
 s_leavingCars<=1'b0;
 w_leavingCars<=1'b0;
 e_leavingCars<=1'b1;//e_red is 1
 e_leavingCarsL<=1'b1;
 w_leavingCarsL<=1'b0;
 s_leavingCarsL<=1'b0;
 n_leavingCarsL<=1'b0;
 #10
 state1<=n_s_y;
 #10
 state1 <= e_w;
 n_leavingCars<=1'b0;
 s_leavingCars<=1'b1;//s_red is 1
 w_leavingCars<=1'b0;
 e_leavingCars<=1'b1;
 e_leavingCarsL<=1'b0;
 w_leavingCarsL<=1'b0;
 s_leavingCarsL<=1'b0;
 n_leavingCarsL<=1'b1;//n_red is 1
 #100
 $stop;
 end
endmodule
