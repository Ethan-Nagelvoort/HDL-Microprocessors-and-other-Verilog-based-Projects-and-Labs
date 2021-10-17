`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2020 06:25:19 PM
// Design Name: 
// Module Name: pedestrian_crossing
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


module pedestrian_crossing(input rst, CLK,  pss, psn, pse, psw,
input [4:0] state1,
output reg [1:0] p_lights, p_lightn, p_lightw, p_lighte);
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
parameter [1:0] off = 2'b00;//pedlight off
parameter [1:0] walking_man = 2'b01; //pedlight displays walking man
parameter [1:0] red_hand = 2'b10; //pedlight displays red hand
always @ (posedge CLK) begin
if(rst == 1'b1)begin
p_lights <= off;
p_lightn <= off;
p_lightw <= off;
p_lighte <= off;
end
end

always @(state1)begin //split it up into two always blocks so there would not be an offset of 1 clock cycle
case(state1) 
/*
In each green-state, the p_lights pedestrains can't cross are set to off. Then if the pedestrian sensor detects a pedestrain
then the p_light in the corresponding direction turns to walking man. If it doesn't detect a pedestrian, then that p_light
is set to off.
*/
n_s:begin
p_lightn<= off;
p_lights<= off;
if(psw == 1'b1) 
p_lightw <= walking_man;
else
p_lightw <= off;
if(pse == 1'b1) 
p_lighte <= walking_man;
else 
p_lighte <= off;
end

/*
In each yellow state, the case detects if the p_light(s) the pedestrians can cross is set to walking man. 
If so, then that p_light is set to red_hand.
*/
n_s_y:begin
if(p_lightw == walking_man)
p_lightw <= red_hand;
if(p_lighte == walking_man)
p_lighte <= red_hand;
end

e_w:begin
p_lightw <= off;
p_lighte <= off;
if(psn == 1'b1) 
p_lightn <= walking_man;
else
p_lightn <= off;
if(pss == 1'b1)  
p_lights <= walking_man;
else
p_lights <= off;
end

e_w_y: begin
if(p_lightn == walking_man)
p_lightn <= red_hand;
if(p_lights == walking_man)
p_lights <= red_hand;
end

n_nl:begin
p_lightn<= off;
p_lights<= off;
p_lighte<= off;
if(psw == 1'b1) 
p_lightw <= walking_man;
else
p_lightw <= off;
end

n_nl_y:begin
if(psw == 1'b1) 
p_lightw <= red_hand;
end

s_sl:begin
p_lightw<= off;
p_lights<= off;
p_lightn<= off;
if(pse == 1'b1) 
p_lighte <= walking_man;
else
p_lighte <= off;
end

s_sl_y:begin
if(pse == 1'b1) 
p_lighte <= red_hand;
end

w_wl:begin
p_lightw<= off;
p_lightn<= off;
p_lighte<= off;
if(pss == 1'b1) 
p_lights <= walking_man;
else
p_lights <= off;
end

w_wl_y:begin
if(pss == 1'b1) 
p_lights <= red_hand;
end

e_el:begin
p_lightw<= off;
p_lights<= off;
p_lighte<= off;
if(psn == 1'b1) 
p_lightn <= walking_man;
else
p_lightn <= off;
end

e_el_y:begin
if(psn == 1'b1) 
p_lightn <= red_hand;
end

/*
In the rest of these state, it is impossible for pedestrians to cross, so all p_lights are off
*/
sl_nl:begin
p_lightn<= off;
p_lights<= off;
p_lighte<= off;
p_lightw<= off;
end

sl_nl_y:begin
p_lightn<= off;
p_lights<= off;
p_lighte<= off;
p_lightw<= off;
end

el_wl:begin
p_lightn<= off;
p_lights<= off;
p_lighte<= off;
p_lightw<= off;
end

el_wl_y:begin
p_lightn<= off;
p_lights<= off;
p_lighte<= off;
p_lightw<= off;
end
endcase
end
endmodule
