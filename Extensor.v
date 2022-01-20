module Extensor(Entrada0, Entrada1, ExtentType, Saida);

	input [16:0] Entrada0;
	input [21:0] Entrada1;
	input ExtentType;
	output reg [31:0] Saida;
	
	always @(*) begin
		case(ExtentType)
		0: begin
				Saida = Entrada0;
				if(Entrada0[16] == 1)
					Saida = Saida + 32'b11111111111111100000000000000000;
			end
		1: begin
				Saida = Entrada1;
				if(Entrada1[21] == 1)
					Saida = Saida + 32'b11111111110000000000000000000000;
			end
		endcase
	end
	
endmodule