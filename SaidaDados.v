module SaidaDados(Dado, OutWrite, CLK, Reset, Display1, Display2, Display3, Display4, LEDs);

	input [31:0] Dado;
	wire [3:0] Centena, Dezena, Unidade;
	wire [6:0] HEXc, HEXd, HEXu, HEXn;
	wire [31:0] BIN;
	input OutWrite, CLK, Reset;
	output reg [6:0] Display1, Display2, Display3, Display4;
	output reg [10:0] LEDs;
	
	initial begin
		Display3 = 7'b1111111;
		Display2 = 7'b1111111;
		Display1 = 7'b1111111;
		Display4 = 7'b1111111;
	end

	Negativo Negativo(.NUM(Dado), .BIN(BIN), .HEX(HEXn));
	DivisaoCasas DivisaoCasas(.NUM(BIN[9:0]), .C(Centena), .D(Dezena), .U(Unidade));
	DecodBCD DecodBCD_Centena (.NUM(Centena), .HEX(HEXc));
	DecodBCD DecodBCD_Dezena (.NUM(Dezena), .HEX(HEXd));
	DecodBCD DecodBCD_Unidade (.NUM(Unidade), .HEX(HEXu));
	
	always @(negedge CLK) begin
		if (Reset == 1) begin
			Display3 = 7'b1111111;
			Display2 = 7'b1111111;
			Display1 = 7'b1111111;
			Display4 = 7'b1111111;
			LEDs = 0;
		end
		if (OutWrite == 1) begin
			Display3 = HEXc;
			Display2 = HEXd;
			Display1 = HEXu;
			Display4 = HEXn;
			LEDs = Dado;
		end
	end
	
endmodule