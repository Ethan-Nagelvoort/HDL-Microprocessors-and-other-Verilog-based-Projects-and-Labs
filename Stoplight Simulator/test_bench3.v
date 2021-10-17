`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2020 02:24:12 AM
// Design Name: 
// Module Name: test_bench3
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


module test_bench3;
reg CLK, rst;
reg [4:0] w_incomingCars, e_incomingCars, s_incomingCars, n_incomingCars, 
 w_leavingCars, e_leavingCars, n_leavingCars, s_leavingCars,
 w_incomingCars2, e_incomingCars2, s_incomingCars2, n_incomingCars2, 
 w_leavingCars2, e_leavingCars2, n_leavingCars2, s_leavingCars2,
 w_incomingCarsL, e_incomingCarsL, s_incomingCarsL, n_incomingCarsL, 
 w_leavingCarsL, e_leavingCarsL, n_leavingCarsL, s_leavingCarsL;
 wire [4:0] w_counter, e_counter, n_counter, s_counter;
 wire high_low;

traffic_signal DUT2 (.CLK(CLK), .rst(rst), .w_counter(w_counter), .e_counter(e_counter), .n_counter(n_counter), .s_counter(s_counter), .high_low(high_low), 
  .w_incomingCars(w_incomingCars), .e_incomingCars(e_incomingCars), .s_incomingCars(s_incomingCars), 
  .n_incomingCars(n_incomingCars), .w_leavingCars(w_leavingCars), .e_leavingCars(e_leavingCars),
  .n_leavingCars(n_leavingCars), .s_leavingCars(s_leavingCars),
 .w_incomingCars2(w_incomingCars2), .e_incomingCars2(e_incomingCars2), .s_incomingCars2(s_incomingCars2), 
 .n_incomingCars2(n_incomingCars2), .w_leavingCars2(w_leavingCars2), .e_leavingCars2(e_leavingCars2), 
 .n_leavingCars2(n_leavingCars2), .s_leavingCars2(s_leavingCars2),
 .w_incomingCarsL(w_incomingCarsL), .e_incomingCarsL(e_incomingCarsL), .s_incomingCarsL(s_incomingCarsL), 
 .n_incomingCarsL(n_incomingCarsL), 
 .w_leavingCarsL(w_leavingCarsL), .e_leavingCarsL(e_leavingCarsL), .n_leavingCarsL(n_leavingCarsL),
 .s_leavingCarsL(s_leavingCarsL));
 
 initial begin
CLK <= 1;
forever #10 CLK <= ~CLK;
 end
 initial
 begin 
 rst<= 1'b1;
 #5
 rst<= 1'b0;
 w_incomingCars <= 5'b00001;
 s_incomingCars <= 5'b00001;
 n_incomingCars <= 5'b00001;
 e_incomingCars <= 5'b00001;
 s_incomingCars2 <= 5'b00001;
 n_incomingCars2 <= 5'b00001;
 e_incomingCars2 <= 5'b00001;
 w_incomingCars2 <= 5'b00001;
 e_incomingCarsL <= 5'b00001;
 w_incomingCarsL <= 5'b00001;
 n_incomingCarsL <= 5'b00001;
 s_incomingCarsL <= 5'b00001;
 e_leavingCars <= 5'b00000;
 w_leavingCars <= 5'b00000;
 n_leavingCars <= 5'b00001;
 s_leavingCars <= 5'b00001;
 s_leavingCars2 <= 5'b00000;
 e_leavingCars2 <= 5'b00000;
 n_leavingCars2 <= 5'b00000;
 w_leavingCars2 <= 5'b00000;
 e_leavingCarsL <= 5'b00000;
 s_leavingCarsL <= 5'b00000;
 n_leavingCarsL <= 5'b00000;
 w_leavingCarsL <= 5'b00000;
 #10
 e_leavingCars <=5'b00001;
 w_leavingCars <= 5'b00001;
 n_leavingCars <= 5'b00000;
 s_leavingCars <= 5'b00000;
 #1000
 $stop;
 end
endmodule
