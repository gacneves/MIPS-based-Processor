module SaidaDados(Dado, IO, CLK, Reset, PC, Display1, Display2, Display3, Display4, DisplayPC1, DisplayPC2, LEDs, IOLED);

	input [31:0] Dado, PC;
	wire [3:0] Centena, Dezena, Unidade, CentenaPC, DezenaPC, UnidadePC;
	wire [6:0] HEXc, HEXd, HEXu, HEXn, HEXd_PC, HEXu_PC;
	wire [31:0] BIN;
	input [1:0] IO;
	input CLK, Reset;
	output reg [6:0] Display1, Display2, Display3, Display4, DisplayPC1, DisplayPC2;
	output reg [10:0] LEDs;
	output reg IOLED;
	
	initial begin
		Display3 = 7'b1111111;
		Display2 = 7'b1111111;
		Display1 = 7'b1111111;
		Display4 = 7'b1111111;
	end

	Negativo Negativo(.NUM(Dado), .BIN(BIN), .HEX(HEXn));
	DivisaoCasas DivisaoCasas(.NUM(BIN[9:0]), .C(Centena), .D(Dezena), .U(Unidade));
	DecodBCD DecodBCD_Centena(.NUM(Centena), .HEX(HEXc));
	DecodBCD DecodBCD_Dezena(.NUM(Dezena), .HEX(HEXd));
	DecodBCD DecodBCD_Unidade(.NUM(Unidade), .HEX(HEXu));
	
	DivisaoCasas DivisaoCasasPC(.NUM(PC[9:0]), .C(CentenaPC), .D(DezenaPC), .U(UnidadePC));
	DecodBCD DecodBCD_DezenaPC(.NUM(DezenaPC), .HEX(HEXd_PC));
	DecodBCD DecodBCD_UnidadePC(.NUM(UnidadePC), .HEX(HEXu_PC));
	
	always @(negedge CLK) begin
		DisplayPC2 = HEXd_PC;
		DisplayPC1 = HEXu_PC;
	
		if (Reset) begin
			Display3 = 7'b1111111;
			Display2 = 7'b1111111;
			Display1 = 7'b1111111;
			Display4 = 7'b1111111;
			DisplayPC1 = 7'b1111111;
			DisplayPC2 = 7'b1111111;
			LEDs = 0;
			IOLED = 0;
		end
		
		if (IO == 2'b01) begin
			Display3 = HEXc;
			Display2 = HEXd;
			Display1 = HEXu;
			Display4 = HEXn;
			LEDs = Dado[10:0];
			IOLED = 1;
		end
		else if (IO == 2'b10)
			IOLED = 1;
		else
			IOLED = 0;
	end
	
endmodule