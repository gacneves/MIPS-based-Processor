module UnidadeProcessamento(nativeCLK, CLK, Reset, FPGA_Switches, DadoLeitHD, DadoLeitBIOS, IOButton, IOLED, InstDst, InstWrite, Finalize, HLT, IO, RegDst, RegDst2, RegWrite, JLink, RDiv, WriteSrc, ExtentType, ALUsrc, ALUop, Jump, JumpR,
MemWrite, MemtoReg, HdToReg, RegToHd, PreempON, PreempOFF, OpCode, DadoLeit1, DadoLeit2, DadoLeitRd, Display4, Display3, Display2, Display1, DisplayPC1, DisplayPC2, LEDs, PC_Saida);

	input nativeCLK, CLK, Reset, IOButton;
	input [31:0] DadoLeitHD, DadoLeitBIOS;
	input [10:0] FPGA_Switches;
	input [3:0] ALUop;
	input [1:0] IO, WriteSrc;
	input InstDst, InstWrite, Finalize, HLT, RegDst, RegDst2, RegWrite, JLink, RDiv, ExtentType, ALUsrc, Jump, JumpR, MemWrite, MemtoReg, HdToReg, RegToHd, PreempON, PreempOFF;
	output [31:0] DadoLeit1, DadoLeit2, DadoLeitRd, PC_Saida;
	output [4:0] OpCode;
	output [6:0] Display4, Display3, Display2, Display1, DisplayPC1, DisplayPC2;
	output [10:0] LEDs;
	output IOLED;
	
	// Interruptor
	wire PCDst;
	wire [31:0] interrAddr;
	Interruptor Interruptor(.CLK(CLK), .PC(PC_Saida), .IO(IO), .Button(IOButton), .OutOfQuantum(OutOfQuantum), .Finalize(Finalize), .interr(PCDst), .interrAddr(interrAddr));
	
	// Timer
	wire OutOfQuantum;
	Timer Timer(.CLK(CLK), .Reset(Reset), .PREEMP_ON(PreempON), .PREEMP_OFF(PreempOFF), .IO(IO), .Finalize(Finalize), .OutOfQuantum(OutOfQuantum));
	
	// Mux PC
	wire [31:0] Prox_Endereco, PC_Count;
	Mux MuxPC(.Entrada0(Prox_Endereco), .Entrada1(interrAddr), .Selecao(PCDst), .Saida(PC_Count));

	// Program Counter
	PC PC(.Prox(PC_Count), .Atual(PC_Saida), .Reset(ResetPC), .CLK(CLK), .HLT(HLT));
	wire [31:0] SomaPC;
	assign SomaPC = PC_Saida + 1;
	
	// Memoria de Instrucao
	wire [31:0] InstLeitMem;
	wire InstWrite;
	RAM_Instrucao RAM_Instrucao(.data(DadoLeitHD), .readAddr(PC_Saida), .writeAddr(DadoLeitRd), .we(InstWrite), .nativeCLK(nativeCLK), .CLK(CLK), .q(InstLeitMem));
	
	// Mux Escolha da fonte de instrucoes
	wire [31:0] Instrucao;
	wire ResetPC;
	MuxInstCtrl MuxInstCtrl(.CLK(CLK), .Reset(Reset), .InstDst(InstDst), .InstBIOS(DadoLeitBIOS), .InstMem(InstLeitMem), .ResetPC(ResetPC), .InstructionSelect(Instrucao));
	
	// OpCode
	assign OpCode = Instrucao[31:27];
	
	// Mux Endereco do registrador de leitura 1
	wire [4:0] RegLeit1;
	MuxReg MuxLeit1(.Entrada0(Instrucao[21:17]), .Entrada1(Instrucao[26:22]), .Selecao(RegDst), .Saida(RegLeit1));
	
	// Mux Endereco do registrador de leitura 2
	wire [4:0] RegLeit2;
	MuxReg MuxLeit2(.Entrada0(Instrucao[16:12]), .Entrada1(Instrucao[26:22]), .Selecao(RegDst2), .Saida(RegLeit2));

	// Banco de Registradores
	BancoDeRegs BancoDeRegs(.RegLeit1(RegLeit1), .RegLeit2(RegLeit2), .RegEscrita(Instrucao[26:22]), .DadoEscrita(DadoEscrita), .R30(RestoDiv), .R31(SomaPC), .HdToReg(HdToReg),
									.RegToHd(RegToHd), .RegWrite(RegWrite), .RDiv(RDiv), .JLink(JLink), .nativeCLK(nativeCLK), .CLK(CLK), .Reset(Reset), .DadoLeit1(DadoLeit1),
									.DadoLeit2(DadoLeit2), .DadoLeitRD(DadoLeitRd));
	
	// Extensor para o dado de entrada
	wire [31:0] ExtentSwitches;
	ExtensorInput ExtensorInput(.Entrada(FPGA_Switches), .Saida(ExtentSwitches));

	// Mux de dado de escrita no registrador
	wire [31:0] DadoEscrita;
	Mux4 MuxRegEscrita(.Entrada0(SaidaMemtoReg), .Entrada1(ExtentSwitches), .Entrada2(DadoLeitHD), .Entrada3(0), .Selecao(WriteSrc), .Saida(DadoEscrita));
	
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
	ULA ULA(.ALUop(ALUop), .D1(DadoLeit1), .D2(D2ULA), .RESULTADO(ResultadoULA), .ZERO(Zero), .RESTOdiv(RestoDiv));
	
	// Mux de branch
	wire [31:0] SaidaMuxBranch;
	Mux MuxBranch(.Entrada0(SomaPC), .Entrada1(SaidaExtensor), .Selecao(Zero), .Saida(SaidaMuxBranch));
	
	// Mux de jump
	wire JumpSel;
	assign JumpSel = Jump | JLink;
	wire [31:0] SaidaMuxJump;
	Mux MuxJump(.Entrada0(SaidaMuxBranch), .Entrada1(SaidaExtensorJump), .Selecao(JumpSel), .Saida(SaidaMuxJump));
	
	// Mux de jumpR
	Mux MuxJumpR(.Entrada0(SaidaMuxJump), .Entrada1(DadoLeit1), .Selecao(JumpR), .Saida(Prox_Endereco));
	
	// Memoria de dados
	wire [31:0] DadoLeitMem;
	RAM_Dados RAM_Dados(.data(DadoLeit2), .addr(ResultadoULA), .we(MemWrite), .nativeCLK(nativeCLK), .CLK(CLK), .q(DadoLeitMem));
	
	// Mux de saida da memoria de dados para o registrador
	wire [31:0] SaidaMemtoReg;
	Mux MuxtoReg(.Entrada0(ResultadoULA), .Entrada1(DadoLeitMem), .Selecao(MemtoReg), .Saida(SaidaMemtoReg));
	
	// Saida de dados
	SaidaDados SaidaDados(.Dado(DadoLeit2), .IO(IO), .CLK(CLK), .Reset(Reset), .PC(PC_Saida), .Display1(Display1), .Display2(Display2), .Display3(Display3), 
	.Display4(Display4), .DisplayPC1(DisplayPC1), .DisplayPC2(DisplayPC2), .LEDs(LEDs), .IOLED(IOLED));
	
endmodule	