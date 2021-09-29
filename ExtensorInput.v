module ExtensorInput(Entrada, Saida);

	input [10:0] Entrada;
	output reg [31:0] Saida;
	
	always @(*) begin
		Saida = Entrada;
		if(Entrada[10] == 1)
			Saida = Saida + 32'b11111111111111111111100000000000;
	end
	
endmodule