module DMem(Endereco, DadoEscrita, MemWrite, DadoLeit, CLK);

	input [31:0] Endereco, DadoEscrita;
	input MemWrite, CLK;
	output [31:0] DadoLeit;
	
	RAM_Dados RAM_Dados(.data(DadoEscrita), .addr(Endereco[9:0]), .we(MemWrite), .clk(CLK), .q(DadoLeit));
	
endmodule