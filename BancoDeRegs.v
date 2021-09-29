module BancoDeRegs(RegLeit1, RegLeit2, RegEscrita, DadoEscrita, R30, R31, RegWrite, RDiv, JLink, CLK, Reset, DadoLeit1, DadoLeit2);

	input [4:0] RegLeit1, RegLeit2, RegEscrita;
	input [31:0] DadoEscrita, R30, R31;
	input CLK, RegWrite, RDiv, JLink, Reset;
	reg [31:0] REG [31:0];
	output [31:0] DadoLeit1, DadoLeit2;
	integer i;
	
	initial begin
		for(i = 0; i < 32 ; i = i + 1)
			REG[i] = 0;
	end
	
	always @(negedge CLK) begin
		if(Reset == 1)
		begin
			for(i = 0; i < 32 ; i = i + 1)
			REG[i] = 0;
		end	
		
		if(RegWrite == 1)
			REG[RegEscrita] = DadoEscrita; 
			
		if(RDiv == 1)
			REG[30] = R30;
			
		if(JLink == 1)
			REG[31] = R31;	
	end
	
	assign DadoLeit1 = REG[RegLeit1];
	assign DadoLeit2 = REG[RegLeit2];
endmodule