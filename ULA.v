module ULA(ALUop, D1, D2, RESULTADO, ZERO, RESTOdiv);

	input [3:0] ALUop;
	input [31:0] D1, D2;
	output reg [31:0] RESULTADO, RESTOdiv;
	output reg ZERO;
	
	always @(ALUop or D1 or D2) begin
		case(ALUop)
			4'b0000: // ADD/ADDI
			begin
				RESULTADO = D1 + D2;
				RESTOdiv = 0;
				ZERO = 0;
			end
			
			4'b0001: // SUB/SUBI
			begin
				RESULTADO = D1 - D2;
				RESTOdiv = 0;
				ZERO = 0;
			end
			
			4'b0010: // MUL
			begin
				RESULTADO = D1 * D2;
				RESTOdiv = 0;
				ZERO = 0;
			end
			
			4'b0011: // DIV
			begin 
				RESULTADO = D1 / D2;
				RESTOdiv = D1 - (D1 / D2) * D2;
				ZERO = 0;
			end
			
			4'b0100: // NOT
			begin
				RESULTADO = ~D1;
				RESTOdiv = 0;
				ZERO = 0;
			end
			
			4'b0101: // AND
			begin
				RESULTADO = D1 & D2;
				RESTOdiv = 0;
				ZERO = 0;
			end
			
			4'b0110: // OR
			begin
				RESULTADO = D1 | D2;
				RESTOdiv = 0;
				ZERO = 0;
			end
			
			4'b0111: //XOR
			begin
				RESULTADO = D1 ^ D2;
				RESTOdiv = 0;
				ZERO = 0;
			end
			
			4'b1000: // SLT
			begin
				if(D1 < D2)
					RESULTADO = 1;
				else
					RESULTADO = 0;
				RESTOdiv = 0;
				ZERO = 0;
			end
			
			4'b1001: // SGT
			begin
				if(D1 > D2)
					RESULTADO = 1;
				else
					RESULTADO = 0;
				RESTOdiv = 0;
				ZERO = 0;
			end
			
			4'b1010: // BEQ
			begin
				if(D1 == D2)
					ZERO = 1;
				else
					ZERO = 0;
				RESTOdiv = 0;
				RESULTADO = 0;
			end
			
			4'b1011: // BNEQ
			begin
				if(D1 != D2)
					ZERO = 1;
				else
					ZERO = 0;
				RESTOdiv = 0;
				RESULTADO = 0;
			end
			
			4'b1100: // SR
			begin 
				RESULTADO = D1 >> 1;
				RESTOdiv = 0;
				ZERO = 0;
			end
			
			4'b1101: // SL
			begin
				RESULTADO = D1 << 1;
				RESTOdiv = 0;
				ZERO = 0;
			end
		
		endcase
		
	end
	
endmodule
	