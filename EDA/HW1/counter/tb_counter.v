`timescale 1ns/100ps


module tb_counter(); 
	reg clk, reset;
        reg [1:0]ctrl; 
	wire[3:0] qout;
       
	parameter DELAY=100;

	counter	C1(qout, reset, clk,ctrl);

	always 
	#(DELAY/2) clk = ~clk;
 always
        #(DELAY*20) ctrl = ctrl+1;
	
	initial 
	begin 
		ctrl=2'b00;
                clk =0; 
		reset=0;
		#(DELAY*5)
		reset=1;
             
		#(DELAY*300)
                reset=0;
                #(DELAY*20)
		$stop; 
	end

endmodule
