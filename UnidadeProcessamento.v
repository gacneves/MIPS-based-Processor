module UnidadeProcessamento(CLK, Reset, FPGA_Switches, HLT, RegDst, RegDst2, RegWrite, JLink, RDiv, WriteSrc, ExtentType, ALUsrc, ALUop, Jump, JumpR,
MemWrite, MemtoReg, OutWrite, OpCode, Display4, Display3, Display2, Display1, LEDs);

	input CLK, Reset;
	input [10:0] FPGA_Switches;
	input [3:0] ALUop;
	input HLT, RegDst, RegDst2, RegWrite, JLink, RDiv, WriteSrc, ExtentType, ALUsrc, Jump, JumpR, MemWrite, MemtoReg, OutWrite;
	output [4:0] OpCode;
	output [6:0] Display4, Display3, Display2, Display1;
	output [10:0] LEDs;

	// Program Counter
	wire [31:0] Prox_Endereco;
	wire [31:0] PC_Saida;
	PC PC(.Prox(Prox_Endereco), .Atual(PC_Saida), .Reset(Reset), .CLK(CLK), .HLT(HLT));
	wire [31:0] SomaPC;
	assign SomaPC = PC_Saida + 1;
	
	// Memoria de Instrucao
	wire [31:0] Instrucao;
	IMem IMem(.Endereco(PC_Saida), .Instrucao(Instrucao), .CLK(CLK));
	
	// OpCode
	assign OpCode = Instrucao[31:27];
	
	// Mux Endereco do registrador de leitura 1
	wire [4:0] RegLeit1;
	MuxReg MuxLeit1(.Entrada0(Instrucao[21:17]), .Entrada1(Instrucao[26:22]), .Selecao(RegDst), .Saida(RegLeit1));
	
	// Mux Endereco do registrador de leitura 2
	wire [4:0] RegLeit2;
	MuxReg MuxLeit2(.Entrada0(Instrucao[16:12]), .Entrada1(Instrucao[26:22]), .Selecao(RegDst2), .Saida(RegLeit2));

	// Banco de Registradores
	wire [31:0] DadoLeit, DadoLeit2;
	BancoDeRegs BancoDeRegs(.RegLeit1(RegLeit1), .RegLeit2(RegLeit2), .RegEscrita(Instrucao[26:22]), .DadoEscrita(DadoEscrita), .R30(RestoDiv), .R31(SomaPC),
									.RegWrite(RegWrite), .RDiv(RDiv), .JLink(JLink), .CLK(CLK), .Reset(Reset), .DadoLeit1(DadoLeit), .DadoLeit2(DadoLeit2));
	
	// Extensor para o dado de entrada
	wire [31:0] ExtentSwitches;
	ExtensorInput ExtensorInput(.Entrada(FPGA_Switches), .Saida(ExtentSwitches));

	// Mux de dado de escrita no registrador
	wire [31:0] DadoEscrita;
	Mux MuxRegEscrita(.Entrada0(SaidaMemtoReg), .Entrada1(ExtentSwitches), .Selecao(WriteSrc), .Saida(DadoEscrita));
	
	// Extensor de enderecos de jump
	wire [31:0] SaidaExtensorJump;
	ExtensorJump ExtensorJump(.Entrada(Instrucao[26:0]), .Saida(SaidaExtensorJump));
	
	// Extensor de imediatos
	wire [31:0] SaidaExtensor;
	Extensor Extensor(.Entrada0(Instrucao[16:0]), .Entrada1(Instrucao[21:0]), .ExtentType(ExtentType), .Saida(SaidaExtensor));
	
	// Mux de entrada 2 da ULA
	wire [31:0] D2ULA;
	Mux MuxALU(.Entrada0(DadoLeit2), .Entrada1(SaidaExtensor), .Selecao(ALUsrc), .Saida(D2ULA));
	
	// ULA
	wire [31:0] ResultadoULA;
	wire [31:0] RestoDiv; 
	wire Zero;
	ULA ULA(.ALUop(ALUop), .D1(DadoLeit), .D2(D2ULA), .RESULTADO(ResultadoULA), .ZERO(Zero), .RESTOdiv(RestoDiv));
	
	// Mux de branch
	wire [31:0] SaidaMuxBranch;
	Mux MuxBranch(.Entrada0(SomaPC), .Entrada1(SaidaExtensor), .Selecao(Zero), .Saida(SaidaMuxBranch));
	
	// Mux de jump
	wire JumpSel;
	assign JumpSel = Jump | JLink;
	wire [31:0] SaidaMuxJump;
	Mux MuxJump(.Entrada0(SaidaMuxBranch), .Entrada1(SaidaExtensorJump), .Selecao(JumpSel), .Saida(SaidaMuxJump));
	
	// Mux de jumpR
	Mux MuxJumpR(.Entrada0(SaidaMuxJump), .Entrada1(DadoLeit), .Selecao(JumpR), .Saida(Prox_Endereco));
	
	// Memoria de dados
	wire [31:0] DadoLeitMem;
	DMem DMem(.Endereco(ResultadoULA), .DadoEscrita(DadoLeit2), .MemWrite(MemWrite), .DadoLeit(DadoLeitMem), .CLK(CLK));
	
	// Mux de saida da memoria de dados para o registrador
	wire [31:0] SaidaMemtoReg;
	Mux MuxtoReg(.Entrada0(ResultadoULA), .Entrada1(DadoLeitMem), .Selecao(MemtoReg), .Saida(SaidaMemtoReg));
	
	// Saida de dados
	SaidaDados SaidaDados(.Dado(DadoLeit2), .OutWrite(OutWrite), .CLK(CLK), .Reset(Reset), .Display1(Display1), .Display2(Display2), .Display3(Display3), 
	.Display4(Display4), .LEDs(LEDs));
	
endmodule	