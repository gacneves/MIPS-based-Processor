module IMem(Endereco, Instrucao, CLK);

	input [31:0] Endereco;
	input CLK;
	output [31:0] Instrucao;
	
	ROM_Instrucao ROM_Instrucao(.addr(Endereco[9:0]), .clk(CLK), .q(Instrucao));
	
endmodule