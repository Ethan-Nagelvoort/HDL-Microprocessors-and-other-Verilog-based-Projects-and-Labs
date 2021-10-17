`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 11:14:01 PM
// Design Name: 
// Module Name: red_light
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

/*
CLK-clock
rst - reset
w_leavingCars - detects if car leaves west side
e_leavingCars - detects if car leaves east side
n_leavingCars - detect if car leaves north side
s_leavingCars - detects if car leaves south side
w_leavingCarsL - detects if car leaves west left side
e_leavingCarsL - detects if car leaves east left side
n_leavingCarsL - detect if car leaves north left side
s_leavingCarsL - detects if car leaves south left side
state1 - current state/configuration of the traffic lights
w_red - sensor that detects if car runs red light on west or west left
e_red - sensor that detects if car runs red light on east or east left
n_red - sensor that detects if car runs red light on north or north left
s_red - sensor that detects if car runs red light on south or south left
*/
//if this sensor is 1, then picture is taken, sensor then reverts back to 0
//if any incoming car input is 1, then there is a car that ran a red light
module red_light(input CLK, rst,  w_leavingCars, e_leavingCars, 
n_leavingCars, s_leavingCars, w_leavingCarsL, e_leavingCarsL,
 n_leavingCarsL, s_leavingCarsL,
input [4:0] state1,
output reg w_red, e_red, s_red, n_red);
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
always @(posedge CLK) begin
if(rst == 1'b1)begin
w_red<= 1'b0;
e_red<= 1'b0;
s_red<= 1'b0;
n_red<= 1'b0;
end end
always @(state1)begin
case(state1)

/*
In each case, we first see set the sensors that represent the side with green lights to 0.
Then we have an if statement for each side where there is a red light. If there is a car leaving that side
then we set the sensor to that represents that side to 1, if not then it is set to 0.
*/

n_s: begin//north and south light is green
n_red <= 1'b0;
s_red <= 1'b0;
if(e_leavingCars == 1'b1 || e_leavingCarsL == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
if(w_leavingCars == 1'b1 || w_leavingCarsL == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
end

n_s_y:begin//north and south light is yellow
n_red <= 1'b0;
s_red <= 1'b0;
if(e_leavingCars == 1'b1 || e_leavingCarsL == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
if(w_leavingCars == 1'b1 || w_leavingCarsL == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
end

e_w:begin //east and west light is green
e_red <= 1'b0;
w_red <= 1'b0;
if(n_leavingCars == 1'b1 || n_leavingCarsL == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(s_leavingCars == 1'b1 || s_leavingCarsL == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
end

e_w_y: begin//east and west ligh is yellow
e_red <= 1'b0;
w_red <= 1'b0;
if(n_leavingCars == 1'b1 || n_leavingCarsL == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(s_leavingCars == 1'b1 || s_leavingCarsL == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
end

n_nl: begin //north and north left
n_red <= 1'b0;
if(w_leavingCars == 1'b1 || w_leavingCarsL == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
if(s_leavingCars == 1'b1 || s_leavingCarsL == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
if(e_leavingCars == 1'b1 || e_leavingCarsL == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
end

n_nl_y: begin // north and north left yellow
n_red <= 1'b0;
if(w_leavingCars == 1'b1 || w_leavingCarsL == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
if(s_leavingCars == 1'b1 || s_leavingCarsL == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
if(e_leavingCars == 1'b1 || e_leavingCarsL == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
end

s_sl: begin // south and south left
s_red <= 1'b0;
if(w_leavingCars == 1'b1 || w_leavingCarsL == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
if(n_leavingCars == 1'b1 || n_leavingCarsL == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(e_leavingCars == 1'b1 || e_leavingCarsL == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
end

s_sl_y: begin // south and south left yellow
s_red <= 1'b0;
if(w_leavingCars == 1'b1 || w_leavingCarsL == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
if(n_leavingCars == 1'b1 || n_leavingCarsL == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(e_leavingCars == 1'b1 || e_leavingCarsL == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
end

w_wl: begin // west and west left 
w_red <= 1'b0;
if(s_leavingCars == 1'b1 || s_leavingCarsL == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
if(n_leavingCars == 1'b1 || n_leavingCarsL == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(e_leavingCars == 1'b1 || e_leavingCarsL == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
end

w_wl_y: begin // west and west left yellow
w_red <= 1'b0;
if(s_leavingCars == 1'b1 || s_leavingCarsL == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
if(n_leavingCars == 1'b1 || n_leavingCarsL == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(e_leavingCars == 1'b1 || e_leavingCarsL == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
end

e_el: begin // east and east left
e_red <= 1'b0;
if(s_leavingCars == 1'b1 || s_leavingCarsL == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
if(n_leavingCars == 1'b1 || n_leavingCarsL == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(w_leavingCars == 1'b1 || w_leavingCarsL == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
end

e_el_y:begin // east and east left yellow
e_red <= 1'b0;
if(s_leavingCars == 1'b1 || s_leavingCarsL == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
if(n_leavingCars == 1'b1 || n_leavingCarsL == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(w_leavingCars == 1'b1 || w_leavingCarsL == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
end

sl_nl: begin// south left and north left
if(s_leavingCars == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
if(n_leavingCars == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(w_leavingCars == 1'b1 || w_leavingCarsL == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
if(e_leavingCars == 1'b1 || e_leavingCarsL == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
end

sl_nl_y: begin// south left and north left yellow
if(s_leavingCars == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
if(n_leavingCars == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(w_leavingCars == 1'b1 || w_leavingCarsL == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
if(e_leavingCars == 1'b1 || e_leavingCarsL == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
end 

el_wl: begin // west left and east left
if(s_leavingCars == 1'b1 || s_leavingCarsL == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
if(n_leavingCars == 1'b1 || n_leavingCarsL == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(w_leavingCars == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
if(e_leavingCars == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
end 

el_wl_y:begin // west left and east left yellow
if(s_leavingCars == 1'b1 || s_leavingCarsL == 1'b1)
s_red <= 1'b1;
else
s_red <= 1'b0;
if(n_leavingCars == 1'b1 || n_leavingCarsL == 1'b1)
n_red <= 1'b1;
else
n_red <= 1'b0;
if(w_leavingCars == 1'b1)
w_red <= 1'b1;
else
w_red <= 1'b0;
if(e_leavingCars == 1'b1)
e_red <= 1'b1;
else
e_red <= 1'b0;
end 
endcase
end
endmodule
