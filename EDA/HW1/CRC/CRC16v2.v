module CRC16v2(
	input wire [7:0] data,
	input wire clk,
	input wire rst,
	input wire enable,
	output reg [15:0] CRCOUT);

	parameter Ploy = 16'h8408;
	reg [15:0] crc_reg = 16'h6363;
	reg [7:0] data_reg = 8'b0;

	integer counter = 0;
	reg temp = 1'b1;

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			// reset
			crc_reg = 16'h6363;
			data_reg = 8'b0;
			counter = 0;
		
		end
		else if (enable == 0) begin
			crc_reg = 16'h6363;
			data_reg = 8'b0;
			counter = 0;
		end		
		else if (enable) begin
			case(counter)
				0: begin
					data_reg = data;
					crc_reg[7:0] = crc_reg[7:0]^data_reg;
				end

				8: begin
					temp = crc_reg[0];
					crc_reg=crc_reg>>1;
					if(temp == 1) crc_reg = crc_reg^Ploy;
					CRCOUT[7:0] = crc_reg[15:8];
					CRCOUT[15:8] = crc_reg[7:0];
				end

				default: begin
					temp = crc_reg[0];
					crc_reg = crc_reg>>1;
					if(temp == 1) crc_reg = crc_reg^Ploy;
				end
			endcase

			if(counter == 8) counter = 0;
			else counter = counter + 1;
		end
	end
endmodule // CRC16v2
