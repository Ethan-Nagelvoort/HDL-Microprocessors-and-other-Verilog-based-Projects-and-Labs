`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ethan Nagelvoort
// 
// Create Date: 04/05/2020 11:21:26 AM
// Design Name: 
// Module Name: traffic_lights
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
CLK - clock
rst - reset
w_presence - senses if there is a car at the west light
e_presence - senses if there is a car at the east light
n_presence - senses if there is a car at the north light
s_presence - senses if there is a car at the south light
w_light - west traffic light
e_light - east traffic light
s_light - south traffic light
n_light - north traffic light
wl_light - west left traffic light
el_light - east left traffic light
sl_light - south left traffic light
nl_light - north left traffic light

*/
module traffic_lights(input CLK, rst,
w_presence, e_presence, n_presence, s_presence, nl_presence, sl_presence, el_presence, wl_presence,
output reg [1:0] w_light, e_light, s_light, n_light, wl_light, el_light, sl_light, nl_light,
output reg [4:0] state1);
reg [4:0] state; //determines the next state of the traffic lights
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

reg [3:0] time_count;//time counter for how long traffic lights will be on 
always @ (posedge CLK) begin
if(rst==1'b1) begin//if rst is on, state is n_s
state <= n_s;
time_count <= 3'b000;
end
else begin

case(state)
//state for north and south light-green
n_s: begin  
if(n_presence>1'b0 || s_presence>1'b0) begin//check is sensors detect cars in these lanes
if((time_count > 3'b110)) 
begin
if(e_presence> 1'b0 || w_presence> 1'b0  || el_presence> 1'b0 || 
wl_presence> 1'b0 || sl_presence> 1'b0 || nl_presence> 1'b0) begin //check if there are cars in any other lane
time_count <= 3'b000;//set time counter back to zero
state <= n_s_y; // state goes to north and south yellow light
end end
else 
begin 
time_count <= time_count + 3'b001; // increment timer, will be on for at least 4 clock cycles
state <= n_s;//state does not change
end 
end
if(n_presence == 1'b0 && s_presence == 1'b0)
begin
state <= e_w;
end end 

//state for north and south light - yellow
n_s_y: begin
if (time_count > 3'b011) begin
time_count <= 3'b000;//set time counter back to zero
state <= e_w; //state goes to east west light
end
else begin
time_count <= time_count + 3'b001;//increment time count, yellow light last for 3 clock cycles
state <= n_s_y;//state does not change
end end

//state for east and west light-green
e_w: begin 
if(e_presence > 1'b0 || w_presence > 1'b0) begin
if(time_count > 3'b110)
begin
if( s_presence> 1'b0 || n_presence> 1'b0 || el_presence> 1'b0 || 
wl_presence> 1'b0 || sl_presence> 1'b0 || nl_presence> 1'b0) begin
time_count <= 3'b000;//set time counter back to zero
state <= e_w_y; // state goes to east and west yellow light
end end
else begin 
time_count <= time_count + 3'b001; // increment timer, will be on for at least 4 clock cycles
state <= e_w;//state does not change
end 
end
if(e_presence == 1'b0 && w_presence == 1'b0) begin
state <= n_s;
end end 

//state for north and south light - yellow
e_w_y: begin
if (time_count > 3'b011) begin
time_count <= 3'b000;//set time counter back to zero
state <= n_nl; //state goes to north north left light 
end
else begin
time_count <= time_count + 3'b001;//increment time count, yellow light last for 3 clock cycles
state <= e_w_y;//state does not change
end end

//state for north and north left green
n_nl: begin 
if(n_presence > 1'b0 || nl_presence > 1'b0) begin
if(time_count > 3'b110)
begin
if(e_presence> 1'b0 || w_presence> 1'b0 || s_presence> 1'b0 || el_presence> 1'b0 || 
wl_presence> 1'b0 || sl_presence> 1'b0) begin
time_count <= 3'b000;//set time counter back to zero
state <= n_nl_y; // state goes to north north left yellow light
end end
else begin 
time_count <= time_count + 3'b001; // increment timer, will be on for at least 4 clock cycles
state <= n_nl;//state does not change
end 
end
if(n_presence == 1'b0 && nl_presence == 1'b0) begin
state <= s_sl; // go directly to next state skip yellow state
end end 

//state for north north left - yellow
n_nl_y: begin
if (time_count > 3'b011) begin
time_count <= 3'b000;//set time counter back to zero
state <= s_sl; //state goes to south south left 
end
else begin
time_count <= time_count + 3'b001;//increment time count, yellow light last for 3 clock cycles
state <= n_nl_y;//state does not change
end end

//state for south and south left green
s_sl: begin 
if(s_presence > 1'b0 || sl_presence > 1'b0) begin
if(time_count > 3'b110)
begin
if(e_presence> 1'b0 || w_presence> 1'b0 ||  n_presence> 1'b0 || el_presence> 1'b0 || 
wl_presence> 1'b0 || nl_presence> 1'b0) begin
time_count <= 3'b000;//set time counter back to zero
state <= s_sl_y; // state goes to south south left yellow light
end end
else begin 
time_count <= time_count + 3'b001; // increment timer, will be on for at least 4 clock cycles
state <= s_sl;//state does not change
end 
end
if(s_presence == 1'b0 && sl_presence == 1'b0) begin
state <= w_wl; // go directly to next state skip yellow state
end end 

//state for south south left - yellow
s_sl_y: begin
if (time_count > 3'b011) begin
time_count <= 3'b000;//set time counter back to zero
state <= w_wl; //state goes to west west left 
end
else begin
time_count <= time_count + 3'b001;//increment time count, yellow light last for 3 clock cycles
state <= s_sl_y;//state does not change
end end

//state for west and west left green
w_wl: begin 
if(w_presence > 1'b0 || wl_presence > 1'b0) begin
if(time_count > 3'b110)
begin
if(e_presence> 1'b0 ||  s_presence> 1'b0 || n_presence> 1'b0 || el_presence> 1'b0 || 
 sl_presence> 1'b0 || nl_presence> 1'b0) begin
time_count <= 3'b000;//set time counter back to zero
state <= w_wl_y; // state goes to west west left yellow light
end end
else begin 
time_count <= time_count + 3'b001; // increment timer, will be on for at least 4 clock cycles
state <= w_wl;//state does not change
end 
end
if(w_presence == 1'b0 && wl_presence == 1'b0) begin
state <= e_el; // go directly to next state skip yellow state
end end 

//state for west west left - yellow
w_wl_y: begin
if (time_count > 3'b011) begin
time_count <= 3'b000;//set time counter back to zero
state <= e_el; //state goes to east east left 
end
else begin
time_count <= time_count + 3'b001;//increment time count, yellow light last for 3 clock cycles
state <= w_wl_y;//state does not change
end end

//state for east and east left green
e_el: begin 
if(e_presence > 1'b0 || el_presence > 1'b0) begin
if(time_count > 3'b110)
begin
if( w_presence> 1'b0 || s_presence> 1'b0 || n_presence> 1'b0 ||  
wl_presence> 1'b0 || sl_presence> 1'b0 || nl_presence> 1'b0) begin
time_count <= 3'b000;//set time counter back to zero
state <= e_el_y; // state goes to east east left yellow light
end end
else begin 
time_count <= time_count + 3'b001; // increment timer, will be on for at least 4 clock cycles
state <= e_el;//state does not change
end 
end
if(e_presence == 1'b0 && el_presence == 1'b0) begin
state <= sl_nl; // go directly to next state skip yellow state
end end

//state for east east left - yellow
e_el_y: begin
if (time_count > 3'b011) begin
time_count <= 3'b000;//set time counter back to zero
state <= sl_nl; //state goes to south left north left
end
else begin
time_count <= time_count + 3'b001;//increment time count, yellow light last for 3 clock cycles
state <= e_el_y;//state does not change
end end

//state for south left and north left green
sl_nl: begin 
if(sl_presence > 1'b0 || nl_presence > 1'b0) begin
if(time_count > 3'b110)
begin
if(e_presence> 1'b0 || w_presence> 1'b0 || s_presence> 1'b0 || n_presence> 1'b0 || el_presence> 1'b0 || 
wl_presence> 1'b0) begin
time_count <= 3'b000;//set time counter back to zero
state <= sl_nl_y; // state goes to south left north left yellow light
end end
else begin 
time_count <= time_count + 3'b001; // increment timer, will be on for at least 4 clock cycles
state <= sl_nl;//state does not change
end 
end
if(sl_presence == 1'b0 && nl_presence == 1'b0) begin
state <= el_wl; // go directly to next state skip yellow state
end end 

//state for south left and north left - yellow
sl_nl_y: begin
if (time_count > 3'b011) begin
time_count <= 3'b000;//set time counter back to zero
state <= el_wl; //state goes to east left west left
end
else begin
time_count <= time_count + 3'b001;//increment time count, yellow light last for 3 clock cycles
state <= sl_nl_y;//state does not change
end end

//state for east left and west left green
el_wl: begin 
if(el_presence > 1'b0 || wl_presence > 1'b0) begin
if(time_count > 3'b110)
begin
if(e_presence> 1'b0 || w_presence> 1'b0 || s_presence> 1'b0 || n_presence> 1'b0 || sl_presence> 1'b0 || nl_presence> 1'b0) begin
time_count <= 3'b000;//set time counter back to zero
state <= el_wl_y; // state goes to east left west left yellow light
end end
else begin 
time_count <= time_count + 3'b001; // increment timer, will be on for at least 4 clock cycles
state <= el_wl;//state does not change
end 
end
if(el_presence == 1'b0 && wl_presence == 1'b0) begin
state <= n_s; // go directly to next state skip yellow state
end end 

//state for east left and west left - yellow
el_wl_y: begin
if (time_count > 3'b011) begin
time_count <= 3'b000;//set time counter back to zero
state <= n_s; //state goes to north south
end
else begin
time_count <= time_count + 3'b001;//increment time count, yellow light last for 3 clock cycles
state <= el_wl_y;//state does not change
end end

endcase
end end


always @(state) begin //always block with states, will describe light color
case(state) 

/*
In each state, we set state1 to what the current state is and set the lights to what they are according the the state
*/
n_s: begin//north and south light is green
state1 = n_s;
n_light = g;
s_light = g;
e_light = r;
w_light = r;

nl_light = r;
sl_light = r;
el_light = r;
wl_light = r;
end 

n_s_y:begin//north and south light is yellow
state1 = n_s_y;
n_light = y;
s_light = y;
e_light = r;
w_light = r;

nl_light = r;
sl_light = r;
el_light = r;
wl_light = r;
end

e_w:begin //east and west light is green
state1 = e_w;
n_light = r;
s_light = r;
e_light = g;
w_light = g;

nl_light = r;
sl_light = r;
el_light = r;
wl_light = r;
end

e_w_y: begin//east and west ligh is yellow
state1 = e_w_y;
n_light = r;
s_light = r;
e_light = y;
w_light = y;

nl_light = r;
sl_light = r;
el_light = r;
wl_light = r;
end

n_nl: begin //north and north left
state1 = n_nl;
n_light = g;
s_light = r;
e_light = r;
w_light = r;

nl_light = g;
sl_light = r;
el_light = r;
wl_light = r;
end

n_nl_y: begin // north and north left yellow
state1 = n_nl_y;
n_light = y;
s_light = r;
e_light = r;
w_light = r;

nl_light = y;
sl_light = r;
el_light = r;
wl_light = r;
end

s_sl: begin // south and south left
state1 = s_sl;
n_light = r;
s_light = g;
e_light = r;
w_light = r;

nl_light = r;
sl_light = g;
el_light = r;
wl_light = r;
end

s_sl_y: begin // south and south left yellow
state1 = s_sl_y;
n_light = r;
s_light = y;
e_light = r;
w_light = r;

nl_light = r;
sl_light = y;
el_light = r;
wl_light = r;
end

w_wl: begin // west and west left 
state1 = w_wl;
n_light = r;
s_light = r;
e_light = r;
w_light = g;

nl_light = r;
sl_light = r;
el_light = r;
wl_light = g;
end

w_wl_y: begin // west and west left yellow
state1 = w_wl_y;
n_light = r;
s_light = r;
e_light = r;
w_light = y;

nl_light = r;
sl_light = r;
el_light = r;
wl_light = y;
end

e_el: begin // east and east left
state1 = e_el;
n_light = r;
s_light = r;
e_light = g;
w_light = r;

nl_light = r;
sl_light = r;
el_light = g;
wl_light = r;
end

e_el_y:begin // east and east left yellow
state1 = e_el_y;
n_light = r;
s_light = r;
e_light = y;
w_light = r;

nl_light = r;
sl_light = r;
el_light = y;
wl_light = r;
end

sl_nl: begin// south left and north left
state1 = sl_nl;
n_light = r;
s_light = r;
e_light = r;
w_light = r;

nl_light = g;
sl_light = g;
el_light = r;
wl_light = r;
end

sl_nl_y: begin// south left and north left yellow
state1 = sl_nl_y;
n_light = r;
s_light = r;
e_light = r;
w_light = r;

nl_light = y;
sl_light = y;
el_light = r;
wl_light = r;
end

el_wl: begin // west left and east left
state1 = el_wl;
n_light = r;
s_light = r;
e_light = r;
w_light = r;

nl_light = r;
sl_light = r;
el_light = g;
wl_light = g;
end

el_wl_y:begin // west left and east left yellow
state1 = el_wl_y;
n_light = r;
s_light = r;
e_light = r;
w_light = r;

nl_light = r;
sl_light = r;
el_light = y;
wl_light = y;
end

endcase
end
endmodule
