module CPU (FPGA_Switches, PBUTTON, Reset, CLK, Display4, Display3, Display2, Display1, LEDs);
	input [10:0] FPGA_Switches;
	input Reset, CLK, PBUTTON;
	output [6:0] Display4, Display3, Display2, Display1;
	output [10:0] LEDs;
	
   wire [4:0] OpCode;
	wire [3:0] ALUop;
	wire HLT, RegDst, RegDst2, RegWrite, JLink, RDiv, WriteSrc, ExtentType, ALUsrc, Branch, Jump, JumpR, MemWrite, MemtoReg, OutWrite;
	
	wire Sclk;
	Debounce Debounce(.IN(PBUTTON),.CLK(CLK),.S(Sclk));
	
	UnidadeProcessamento UnidadeProcessamento(.CLK(Sclk), .Reset(Reset), .FPGA_Switches(FPGA_Switches), .HLT(HLT), .RegDst(RegDst), .RegDst2(RegDst2),
															.RegWrite(RegWrite), .JLink(JLink), .RDiv(RDiv), .WriteSrc(WriteSrc), .ExtentType(ExtentType), .ALUsrc(ALUsrc),
															.ALUop(ALUop), .Jump(Jump), .JumpR(JumpR), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .OutWrite(OutWrite),
															.OpCode(OpCode), .Display4(Display4), .Display3(Display3), .Display2(Display2), .Display1(Display1), .LEDs(LEDs));
															
						
	UnidadeControle UnidadeControle(.OpCode(OpCode), .HLT(HLT), .RegDst(RegDst), .RegDst2(RegDst2), .RegWrite(RegWrite), .JLink(JLink), .RDiv(RDiv), 
											  .WriteSrc(WriteSrc), .ExtentType(ExtentType), .ALUsrc(ALUsrc), .ALUop(ALUop), .Jump(Jump), .JumpR(JumpR),
											  .MemWrite(MemWrite), .MemtoReg(MemtoReg), .OutWrite(OutWrite));
											  
endmodule