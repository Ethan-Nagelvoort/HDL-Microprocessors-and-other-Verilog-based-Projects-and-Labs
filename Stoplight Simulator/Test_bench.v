`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 11:34:24 PM
// Design Name: 
// Module Name: Test_bench
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


module Test_bench;
reg CLK, rst, e_presence, n_presence, w_presence, s_presence,
el_presence, nl_presence, wl_presence, sl_presence;
wire [1:0] west, east, south, north, westLeft, eastLeft,
northLeft, southLeft;
wire [4:0] state;

//instantiate module
top_level DUT (.CLK(CLK), .rst(rst),.n_presence(n_presence), .s_presence(s_presence),
.w_presence(w_presence),.e_presence(e_presence),
.west(west), .east(east), .south(south), .north(north),
.state(state), .westLeft(westLeft), .eastLeft(eastLeft),
.northLeft(northLeft), .southLeft(southLeft),  .wl_presence(wl_presence), 
.el_presence(el_presence), .sl_presence(sl_presence), 
.nl_presence(nl_presence));

initial begin
CLK <= 1;
forever #10 CLK <= ~CLK;
 end
 initial
 begin 
  rst <= 1'b1;
  e_presence <= 1'b0;
  w_presence <= 1'b0;
  n_presence <= 1'b0;
  s_presence <= 1'b0;
  el_presence <= 1'b0;
  wl_presence <= 1'b0;
  sl_presence <= 1'b0;
  nl_presence <= 1'b0;
  #10
  rst <=1'b0;
  e_presence <= 1'b1;
  w_presence <= 1'b1;
  n_presence <= 1'b0;//test to see if module skips n_s and n_s_y state since there is not cars there
  s_presence <= 1'b0;
  el_presence <= 1'b0;
  wl_presence <= 1'b0;
  sl_presence <= 1'b0;
  nl_presence <= 1'b0;
  #300//all other presences are 0 so the state e_w should stay for a long time
  //now there is a car in each side so all states should start to appear in order
  n_presence <= 1'b1;
  s_presence <= 1'b1;
  s_presence <= 1'b1;
  el_presence <= 1'b1;
  wl_presence <= 1'b1;
  sl_presence <= 1'b1;
  nl_presence <= 1'b1;
  #1000
  $stop;
 end
endmodule








