`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2020 02:41:10 AM
// Design Name: 
// Module Name: test_level1
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

//should be test_bench1
module test_level1;
reg rst, CLK,  pss, psn, pse, psw;
reg [4:0] state1;
wire [1:0] p_lights, p_lightn, p_lightw, p_lighte;
//instantiate module
pedestrian_crossing DUT1 (.CLK(CLK), .rst(rst), .pss(pss),.psn(psn),.pse(pse),
.psw(psw),.p_lights(p_lights),.p_lightn(p_lightn),.p_lightw( p_lightw),.p_lighte(p_lighte),
  .state1(state1));
  
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

initial begin
CLK <= 1;
forever #10 CLK <= ~CLK;
 end
 initial
 begin 
 rst<= 1'b1;
 #10
 rst<= 1'b0;
 state1 <= n_s;
 pss <= 1'b1;
 pse <= 1'b0;//p_lighte should be set to off
 psn <= 1'b1;
 psw <= 1'b1;
 #10
 state1 <= n_s_y;
 #10
 state1 <= e_w; 
 pse<=1'b1;// set pedestrian presence for east side to 1
 #10
 state1 <= e_w_y;
 #10
 state1 <= n_nl;
 #100
 $stop;
 end
endmodule
