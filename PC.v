module PC(Prox, Atual, Reset, CLK, HLT);

	input [31:0] Prox;
	input Reset, CLK, HLT;
	output reg [31:0] Atual;
	
	initial begin
		Atual = 0;
	end
	
	always @(negedge CLK) begin
		if(HLT==1)
			Atual = Atual;
		else
			Atual = Prox;
		
		if(Reset == 1)
			Atual = 0;

	end
	
endmodule