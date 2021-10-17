`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ethan Nagelvoort
// 
// Create Date: 04/04/2020 11:14:35 PM
// Design Name: 
// Module Name: traffic_signal
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
//purpose of this module is to act like a traffic sensor, module should be named traffic sensor. It counts cars.
/*
CLK - clock
rst - reset
//max number of cars a side can hold is 20
w_incomingCars - number of cars that are incoming on west light
e_incomingCars - number of cars that are incoming on east light
n_incomingCars - number of cars that are incoming on north light
s_incomingCars - number of cars that are incoming on south light
w_leavingCars - number of cars that are leaving west light
e_leavingCars - number of cars that are leaving east light
n_leavingCars - number of cars that are leaving north light
s_leavingCars - number of cars that are leaving south light
w - counts overall cars in west light
e - counts overall cars in east light
n- counts overall cars in north light
s- counts overall cars in south light
If there is a 2 in variable then it is second lane
If there is an L in variable then it is a left turn lane
high_low - if over 25 cars then there is high traffic, if not then low traffic. 1 for high, 0 for low.
*/
module traffic_signal(input CLK, rst, 
input [4:0] w_incomingCars, e_incomingCars, s_incomingCars, n_incomingCars, 
 w_leavingCars, e_leavingCars, n_leavingCars, s_leavingCars,
 w_incomingCars2, e_incomingCars2, s_incomingCars2, n_incomingCars2, 
 w_leavingCars2, e_leavingCars2, n_leavingCars2, s_leavingCars2,
 w_incomingCarsL, e_incomingCarsL, s_incomingCarsL, n_incomingCarsL, 
 w_leavingCarsL, e_leavingCarsL, n_leavingCarsL, s_leavingCarsL,
output reg [4:0] w_counter, e_counter, n_counter, s_counter,
output reg high_low);
reg number; //used to help check if high_low value
//reg [5:0] w_counter, e_counter, n_counter, s_counter; //used to keep track of number of cars in each direction
always @(posedge(CLK))
begin
if(rst==1'b1) //if reset is true, reset all counters
begin
w_counter <= 5'b00000;
e_counter <= 5'b00000; 
n_counter <= 5'b00000; 
s_counter <= 5'b00000;
end
else begin
//add and subtract incoming and leaving cars from counters
w_counter <= w_counter + w_incomingCars; 
w_counter <= w_counter + w_incomingCars2;
w_counter <= w_counter + w_incomingCarsL;
w_counter <= w_counter - w_leavingCars;
w_counter <= w_counter - w_leavingCars2;
w_counter <= w_counter - w_leavingCarsL;

e_counter <= e_counter + e_incomingCars;
e_counter <= e_counter + e_incomingCars2;
e_counter <= e_counter + e_incomingCarsL;
e_counter <= e_counter - e_leavingCars;
e_counter <= e_counter - e_leavingCars2;
e_counter <= e_counter - e_leavingCarsL;

n_counter <= n_counter + n_incomingCars;
n_counter <= n_counter + n_incomingCars2;
n_counter <= n_counter + n_incomingCarsL;
n_counter <= n_counter - n_leavingCars;
n_counter <= n_counter - n_leavingCars2;
n_counter <= n_counter - n_leavingCarsL;

s_counter <= s_counter + s_incomingCars;
s_counter <= s_counter + s_incomingCars2;
s_counter <= s_counter + s_incomingCarsL;
s_counter <= s_counter - s_leavingCars;
s_counter <= s_counter - s_leavingCars2;
s_counter <= s_counter - s_leavingCarsL;

//check if all counters are over 25
if(w_counter + n_counter + s_counter + e_counter > 5'b11001)
high_low <= 1'b1; 
else 
high_low <= 1'b0;

//have counter registers equal to output
/*e <= e_counter;
w <= w_counter;
s <= s_counter;
n <= n_counter;*/
end
end
endmodule
