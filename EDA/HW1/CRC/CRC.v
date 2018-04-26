module CRC(
	input wire [7:0]data,
	input wire clk,
	input wire reset,
    	input wire enable,
	output reg [15:0] CRCOut);

	parameter PLOY_16 = 16'h6363;
	reg [15:0]crc_reg = 16'h6363;
	reg temp;
	reg [4:0]i;
	always@(posedge clk or posedge reset) begin
		if(reset) begin
			CRCOut = 16'h0;
			crc_reg = 16'h6363;
		end
		else if(enable) begin
			crc_reg = 16'h6363;
			crc_reg[7:0] = crc_reg[7:0]^data[7:0];
			for(i=0;i<8;i=i+1) begin
				temp = crc_reg[0];
				crc_reg <= crc_reg>>1;
				if(temp==1) begin
					crc_reg <= crc_reg^PLOY_16;
				end
			end
			CRCOut[0] = crc_reg[15];
			CRCOut[1] = crc_reg[14];
			CRCOut[2] = crc_reg[13];
			CRCOut[3] = crc_reg[12];
			CRCOut[4] = crc_reg[11];
			CRCOut[5] = crc_reg[10];
			CRCOut[6] = crc_reg[9];
			CRCOut[7] = crc_reg[8];
			CRCOut[8] = crc_reg[7];
			CRCOut[9] = crc_reg[6];
			CRCOut[10] = crc_reg[5];
			CRCOut[11] = crc_reg[4];
			CRCOut[12] = crc_reg[3];
			CRCOut[13] = crc_reg[2];
			CRCOut[14] = crc_reg[1];
			CRCOut[15] = crc_reg[0];
		end
	end
 
        

	
	 
endmodule
