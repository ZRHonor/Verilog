`timescale 1ns/100ps

module tb_CRC16v2();
	reg [7:0] data;
	reg enable;
	reg rst;
	reg clk;
	parameter DELAY=100;

	CRC16v2 C1(data, clk, rst, enable);

	always begin
		#(DELAY/2) clk = ~clk;
	end

	initial begin
		clk = 0;
		rst = 0;
		#(DELAY*10)
		data = 8'h04;
		#(DELAY*5)
		enable = 1;
		#(DELAY*4)
		data = 8'h55;
		#(DELAY*9)
		data = 8'hAA;
		#(DELAY*9)
		data = 8'h73;
		#(DELAY*15)
		enable = 0;
		#(DELAY*30)
		$stop;
	end

endmodule // tb_CRC16v2
