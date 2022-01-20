module ExtensorJump(Entrada, Saida);

	input [26:0] Entrada;
	output reg [31:0] Saida;
	
	always @(*) begin
		Saida = Entrada;
		if(Entrada[26] == 1)
			Saida = Saida + 32'b1111100000000000000000000000000;
	end
	
endmodule