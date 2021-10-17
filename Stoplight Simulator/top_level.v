`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2020 06:46:03 PM
// Design Name: 
// Module Name: top_level
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


module top_level(input CLK, rst, pss, psn, pse, psw, 
w_presence, e_presence, n_presence, s_presence, wl_presence, el_presence, nl_presence, sl_presence,
 w_leavingCars, e_leavingCars, n_leavingCars, s_leavingCars, 
 w_leavingCarsL, e_leavingCarsL, n_leavingCarsL, s_leavingCarsL,
output [1:0] west, east, south, north, pedWest, pedEast, pedSouth, pedNorth, westLeft, eastLeft, southLeft, northLeft,
output [4:0] state,
output wr_sensor, nr_sensor, er_sensor, sr_sensor);
wire[1:0] w_light, e_light, s_light, n_light, p_lights, p_lightn, p_lightw, p_lighte, wl_light, el_light, sl_light,
nl_light;
wire[4:0] state1;
wire w_red, e_red, n_red, s_red;
//instantiating traffic lights
traffic_lights DUT (.CLK(CLK), .rst(rst), .w_presence(w_presence), 
.e_presence(e_presence), .n_presence(n_presence), .s_presence(s_presence),
.w_light(w_light), .e_light(e_light), .s_light(s_light), 
.n_light(n_light),.state1(state1), .wl_light(wl_light),.el_light(el_light),.sl_light(sl_light),
.nl_light(nl_light), .wl_presence(wl_presence), .el_presence(el_presence), .sl_presence(sl_presence), 
.nl_presence(nl_presence));
//instantiating pedestrian Crossing
pedestrian_crossing DUT1 (.CLK(CLK), .rst(rst), .pss(pss),.psn(psn),.pse(pse),
.psw(psw),.p_lights(p_lights),.p_lightn(p_lightn),.p_lightw( p_lightw),.p_lighte(p_lighte),
  .state1(state1));
//instantiating red light
red_light DUT2 (.CLK(CLK), .rst(rst), .w_leavingCars(w_leavingCars), .e_leavingCars(e_leavingCars), 
.n_leavingCars(n_leavingCars), .s_leavingCars(s_leavingCars), 
.w_leavingCarsL(w_leavingCarsL), .e_leavingCarsL(e_leavingCarsL),
.n_leavingCarsL(n_leavingCarsL), .s_leavingCarsL(s_leavingCarsL),
.state1(state1), .w_red(w_red), .n_red(n_red), .s_red(s_red), .e_red(e_red));
//set wires to outputs
assign state = state1;
assign pedWest = p_lightw;
assign pedEast = p_lighte;
assign pedSouth = p_lights;
assign pedNorth = p_lightn;
assign west = w_light;
assign east = e_light;
assign north = n_light;
assign south = s_light;
assign westLeft = wl_light;
assign eastLeft = el_light;
assign northLeft = nl_light;
assign southLeft = sl_light;
assign wr_sensor = w_red;
assign er_sensor = e_red;
assign sr_sensor = s_red;
assign nr_sensor = n_red;
endmodule
