`timescale 1ns/100ps


module tb_CRC(); 
	reg clk; 
	reg reset;
        reg [7:0]data;
	reg enable; 
	
	       
	parameter DELAY=100;

	CRC C1(data, clk, reset,enable);

	always 
	#(DELAY/2) clk = ~clk;
 
        
	
	initial 
	begin 
		clk =0; 
		reset=0;
		enable = 1;
		#(DELAY*10)
		
		data=8'h04;
		#(DELAY*200)
		data=8'h55;
             
		#(DELAY*200)
                data=8'hAA;
		#(DELAY*200)
		data=8'h73;		
                #(DELAY*200)
		$stop; 
	end

endmodule
