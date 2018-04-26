module ALU(A,B,result,ovr,cmd); 
	output reg [7:0] result;
	output reg ovr;
	input wire [7:0] A;
	input wire [7:0] B;
	input wire [1:0] cmd;
	reg [8:0] R1;
	always @(*)
	begin
	    R1 = 0;
	    ovr = 0;
	    case(cmd)
              0: result = A;
              1: begin
			if(A < B)
				begin 
					ovr = 1;
					R1[8] = 1;
					R1[7:0] = A[7:0];
					result = R1 - B;
				end
			else
				result = A - B;	
					
				  					
		  end
              2: begin
		 	R1 = A + B;
		 	if(R1 > 255)
		 		ovr = 1;
		 	result[7:0] = R1[7:0];
		 end  
              3: begin
		 	R1 = B + B;
		 	if(R1 > 255)
		 		ovr = 1;
		 	result[7:0] = R1[7:0];
		 end
              default: result = 0;
            endcase
        end

	 
endmodule
