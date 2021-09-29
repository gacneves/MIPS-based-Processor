module MuxReg(Entrada0, Entrada1, Selecao, Saida);

	input [4:0] Entrada0, Entrada1;
	input Selecao;
	output reg [4:0] Saida;

	always @(Entrada0 or Entrada1 or Selecao) begin
		case (Selecao)
			0: Saida = Entrada0;
			1: Saida = Entrada1;
		endcase
	end

endmodule