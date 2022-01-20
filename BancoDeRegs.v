module BancoDeRegs(RegLeit1, RegLeit2, RegEscrita, DadoEscrita, R30, R31, HdToReg, RegToHd, RegWrite, RDiv, JLink, nativeCLK, CLK, Reset, DadoLeit1, DadoLeit2, DadoLeitRD);

	input [4:0] RegLeit1, RegLeit2, RegEscrita;
	input [31:0] DadoEscrita, R30, R31;
	input nativeCLK, CLK, RegWrite, HdToReg, RegToHd, RDiv, JLink, Reset;
	reg [31:0] REG [31:0];
	output reg [31:0] DadoLeit1, DadoLeit2, DadoLeitRD;
	integer i;
	
	localparam a0 = 5'b10010;
	
	always @(negedge CLK) begin
		if(Reset)
		begin
			for(i = 0; i < 32 ; i = i + 1)
			REG[i] = 0;
		end	
		
		if(RegWrite) begin
			if(HdToReg)
				REG[REG[a0]] = DadoEscrita; // Caso especial: Instrucao HDTOREG
			else
				REG[RegEscrita] = DadoEscrita; 
		end
			
		if(RDiv)
			REG[30] = R30;
			
		if(JLink)
			REG[31] = R31;	
	end
	
	always @ (posedge nativeCLK) begin
		DadoLeit1 <= REG[RegLeit1];
		DadoLeit2 <= REG[RegLeit2];
		if(RegToHd)
			DadoLeitRD <= REG[REG[a0]];
		else
			DadoLeitRD <= REG[RegEscrita];
	end
	
endmodule