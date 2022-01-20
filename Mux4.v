module Mux4(Entrada0, Entrada1, Entrada2, Entrada3, Selecao, Saida);

	input [31:0] Entrada0, Entrada1, Entrada2, Entrada3;
	input [1:0] Selecao;
	output reg [31:0] Saida;

	always @ (*) begin
		case (Selecao)
			2'b00: Saida = Entrada0;
			2'b01: Saida = Entrada1;
			2'b10: Saida = Entrada2;
			2'b11: Saida = Entrada3;
		endcase
	end

endmodule
