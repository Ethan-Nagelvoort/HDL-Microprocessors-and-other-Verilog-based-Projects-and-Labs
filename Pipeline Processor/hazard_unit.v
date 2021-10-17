`timescale 1ns / 1ps
//Refer to pgs 39-43
//Stall on PC | Stall on FetchReg | ForwardAD to 2:1mux after RFRD1 | ForwardBD to 2:1mux after RFRD2 | ForwardAE to 3:1 mux before ALUIn1E | ForwardBE to 3:1 mux before ALUIn2E
//inputs BranchD, MtoRFSelE, RFWEE, RFWEM, RFWEW, connects back to og wire
module HazardUnit #(parameter WL = 32, wordLen = 32, WLinput = 5)
(input [WLinput-1:0] rsD, rsE, rtD, rtE, rtdE, rtdM, rtdW,
input MtoRFSelE, MtoRFSelM, BranchD, RFWEE, RFWEM, RFWEW,
output reg [1:0] ForwardAE, ForwardBE,
output reg Flush,
output reg Stall,
output reg ForwardAD, ForwardBD
);

reg lwstall, branchstall;



//forwardAE and BE should be the selects for the 2:1 muxes
always @* begin //forward logic on AE if result of an already executed ALU instruction (from the MEM stage), should be forwarded to the equality (pg. 40)
    if ((rsE != 0) && (rsE == rtdM) && RFWEM)
        ForwardAE = 2'b10;
    else if ((rsE != 0) && (rsE == rtdW) && RFWEW)
		ForwardAE = 2'b01;
    else 
        ForwardAE = 2'b00;


//forwardAD and BD should be selects for the 3:1 muxes
//Forwarding logic on BE. from pg. 40
	if ((rtE != 0) && (rtE == rtdM) && RFWEM)
		ForwardBE = 2'b10;
	else if ((rtE != 0) && (rtE == rtdW) && RFWEW)
		ForwardBE = 2'b01;
	else
	    ForwardBE = 2'b00;
	
	//forwardAD mux
	if ((rsD != 0) && (rsD == rtdW) && (RFWEM))
	    ForwardAD <= 1'b1;
	else
	    ForwardAD <= 1'b0;
	   
	if ((rtD != 0) && (rtD == rtdW) && (RFWEM))
	    ForwardBD <= 1'b1;
	else
	    ForwardBD <= 1'b0;
	    



    if (MtoRFSelE && ((rtE == rsD) || (rtE == rtD))) begin
        lwstall <= 1'b1;
        //Flush <= 1'b1;
    end
    else begin
        lwstall <= 1'b0;
        //Flush <= 1'b0;
    end
    
	if (((rsD == rtdE) || (rtD == rtdE)) && (BranchD) && (RFWEE) || ((rsD == rtdM) || (rtD == rtdM)) && (BranchD) && (MtoRFSelM))
	   branchstall = 1'b1;
	else
	   branchstall = 1'b0;
//if(lwstall != 1'bx && branchstall != 1'bx) begin
//Stall <= lwstall | branchstall;
//Flush <= lwstall | branchstall;

if(lwstall == 1'bx || branchstall == 1'bx) begin
Stall <= 1'b0;
Flush <= 1'b0;
end
else begin
Stall <= lwstall | branchstall;
Flush <= lwstall | branchstall;
end

end




//stalling: if either of the sources of the branch instruction in the ID stage depends on an ALU instruction that is in the EX stage
//(has not been yet executed in the EX stage) or on the result of a lw instruction in the MEM stage, pipeline must be stalled at the ID and IF stages

endmodule
