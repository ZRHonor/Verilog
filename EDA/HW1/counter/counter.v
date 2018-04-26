module counter(qout,reset,clk,ctrl); 
	output reg [3:0] qout;
	input wire clk,reset;
        input wire [1:0] ctrl;

	always @(posedge clk or negedge reset) 
	begin
		if (~reset)
			qout <= 9'h00; 
                else 
            begin case(ctrl)
              00: qout<= qout + 1;
              01: qout<= qout + 2;
              2: qout<= qout - 1;
              3: qout<= qout - 2;
              default: qout<=3;
                  endcase
            end

	end
	 
endmodule
