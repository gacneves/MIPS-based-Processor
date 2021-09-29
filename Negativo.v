module Negativo(NUM,BIN,HEX);

	input [31:0] NUM;
	output reg [31:0] BIN;
	output reg [6:0] HEX;
	integer i;
	
	always@(*)begin
		BIN = NUM;
		if(BIN[31]==1)begin
			for(i=0;i<31;i=i+1)begin
				if(BIN[i]==1)
					BIN[i] = 0;
				else
					BIN[i] = 1;
			end
			BIN = BIN + 1;
			HEX = 7'b1111110;
		end
		else
			HEX = 7'b1111111;
	end

endmodule