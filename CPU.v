module CPU (FPGA_Switches, PButton, Reset, CLK, Display4, Display3, Display2, Display1, DisplayPC1, DisplayPC2, LEDs, IOLED);
	input [10:0] FPGA_Switches;
	input Reset, CLK, PButton;
	output [6:0] Display4, Display3, Display2, Display1, DisplayPC1, DisplayPC2;
	output [10:0] LEDs;
	output IOLED;
	
	wire [31:0] DadoLeitHD, DadoLeitReg1, DadoLeitReg2, DadoLeitRegRD, DadoLeitBIOS, PC;
   wire [4:0] OpCode;
	wire [3:0] ALUop;
	wire [1:0] IO, WriteSrc;
	wire InstDst, InstWrite, Finalize, HLT, RegDst, RegDst2, RegWrite, JLink, RDiv, ExtentType, ALUsrc, Branch, Jump, JumpR, HDWrite, MemWrite, MemtoReg, HdToReg, RegToHd, HdWrite, PreempON, PreempOFF;
	
	wire Sclk;
	DivFreq DivFreq(.CLK(CLK), .OUT(Sclk));
	
	wire IOButton;
	Debounce Debounce(.IN(PButton),.CLK(CLK),.S(IOButton));
	
	BIOS BIOS(.addr(PC), .clk(CLK), .q(DadoLeitBIOS));
	
	UnidadeProcessamento UnidadeProcessamento(.nativeCLK(CLK), .CLK(Sclk), .Reset(Reset), .FPGA_Switches(FPGA_Switches), .DadoLeitHD(DadoLeitHD), .DadoLeitBIOS(DadoLeitBIOS),
															.IOButton(IOButton), .IOLED(IOLED), .InstDst(InstDst), .InstWrite(InstWrite), .Finalize(Finalize), .HLT(HLT), .IO(IO), .RegDst(RegDst), .RegDst2(RegDst2),
															.RegWrite(RegWrite), .JLink(JLink), .RDiv(RDiv), .WriteSrc(WriteSrc), .ExtentType(ExtentType), .ALUsrc(ALUsrc),
															.ALUop(ALUop), .Jump(Jump), .JumpR(JumpR), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .HdToReg(HdToReg), .RegToHd(RegToHd), .PreempON(PreempON),
															.PreempOFF(PreempOFF), .OpCode(OpCode), .DadoLeit1(DadoLeitReg1), .DadoLeit2(DadoLeitReg2),
															.DadoLeitRd(DadoLeitRegRD), .Display4(Display4), .Display3(Display3), .Display2(Display2), .Display1(Display1),
															.DisplayPC1(DisplayPC1), .DisplayPC2(DisplayPC2), .LEDs(LEDs), .PC_Saida(PC));
															
						
	UnidadeControle UnidadeControle(.OpCode(OpCode), .InstDst(InstDst), .InstWrite(InstWrite), .Finalize(Finalize), .HLT(HLT), .IO(IO), .RegDst(RegDst),
											  .RegDst2(RegDst2), .RegWrite(RegWrite), .JLink(JLink), .RDiv(RDiv), .WriteSrc(WriteSrc), .ExtentType(ExtentType),
											  .ALUsrc(ALUsrc), .ALUop(ALUop), .Jump(Jump), .JumpR(JumpR), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .HdToReg(HdToReg),
											  .RegToHd(RegToHd), .HdWrite(HdWrite), .PreempON(PreempON), .PreempOFF(PreempOFF));
	
	DiscoRigido HD(.data(DadoLeitRegRD), .trilha(DadoLeitReg1), .setor(DadoLeitReg2), .we(HdWrite), .nativeCLK(CLK), .CLK(Sclk), .q(DadoLeitHD));
											  
endmodule