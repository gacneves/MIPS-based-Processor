module UnidadeControle (OpCode, HLT, RegDst, RegDst2, RegWrite, JLink, RDiv, WriteSrc, ExtentType, ALUsrc, ALUop, Jump, JumpR, MemWrite, MemtoReg,
OutWrite);

	input [4:0] OpCode;
	output reg [3:0] ALUop;
	output reg HLT, RegDst, RegDst2, RegWrite, JLink, RDiv, WriteSrc, ExtentType, ALUsrc, Jump, JumpR, MemWrite, MemtoReg, OutWrite;

	always @ (OpCode) begin
		case (OpCode)
			5'b00000: begin // ADD
				HLT = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 0;
				ALUop = 4'b0000;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
			
			5'b00001: begin // SUB
				HLT = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 0;
				ALUop = 4'b0001;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
			
			5'b00010: begin // MUL
				HLT = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 0;
				ALUop = 4'b0010;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
			
			5'b00011: begin // DIV
				HLT = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 1;
				JLink = 0;
				RDiv = 1;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 0;
				ALUop = 4'b0011;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
			
			5'b00100: begin // NOT
				HLT = 0;
				RegDst = 0;
				RegDst2 = 1'bx;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'b0100;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
			
			5'b00101: begin // AND
				HLT = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 0;
				ALUop = 4'b0101;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
			
			5'b00110: begin // OR
				HLT = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 0;
				ALUop = 4'b0110;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
			
			5'b00111: begin // XOR
				HLT = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 0;
				ALUop = 4'b0111;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
	
			5'b01000: begin // SLT
				HLT = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 0;
				ALUop = 4'b1000;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
	
			5'b01001: begin // SGT
				HLT = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 0;
				ALUop = 4'b1001;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
	
			5'b01010: begin // JR
				HLT = 0;
				RegDst = 1;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 1;
				MemWrite = 0;
				MemtoReg = 1'bx;
				OutWrite = 0;
			end
	
			5'b01011: begin // IN
				HLT = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 1;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				OutWrite = 0;
			end
			
			5'b01100: begin // OUT
				HLT = 0;
				RegDst = 1'bx;
				RegDst2 = 1;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 1'bx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				OutWrite = 1;
			end
			
			5'b01101: begin // ADDI
				HLT = 0;
				RegDst = 0;
				RegDst2 = 1'bx;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 0;
				ALUsrc = 1;
				ALUop = 4'b0000;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
	
			5'b01110: begin // SUBI
				HLT = 0;
				RegDst = 0;
				RegDst2 = 1'bx;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 1;
				ALUop = 4'b0001;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
			
			5'b01111: begin // BEQ
				HLT = 0;
				RegDst = 0;
				RegDst2 = 1;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 1'bx;
				ExtentType = 0;
				ALUsrc = 0;
				ALUop = 4'b1010;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				OutWrite = 0;
			end
			
			5'b10000: begin // BNEQ
				HLT = 0;
				RegDst = 0;
				RegDst2 = 1;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 1'bx;
				ExtentType = 0;
				ALUsrc = 0;
				ALUop = 4'b1011;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				OutWrite = 0;
			end
			
			5'b10001: begin // LW
				HLT = 0;
				RegDst = 0;
				RegDst2 = 1'bx;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 0;
				ALUsrc = 1;
				ALUop = 4'b0000;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1;
				OutWrite = 0;
			end
			
			5'b10010: begin // SW
				HLT = 0;
				RegDst = 0;
				RegDst2 = 1;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 1'bx;
				ExtentType = 0;
				ALUsrc = 1;
				ALUop = 4'b0000;
				Jump = 0;
				JumpR = 0;
				MemWrite = 1;
				MemtoReg = 1'bx;
				OutWrite = 0;
			end
	
			5'b10011: begin // SR
				HLT = 0;
				RegDst = 0;
				RegDst2 = 1'bx;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'b1100;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
			
			5'b10100: begin // SL
				HLT = 0;
				RegDst = 0;
				RegDst2 = 1'bx;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 0;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'b1101;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 0;
				OutWrite = 0;
			end
			
			5'b10101: begin // J
				HLT = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 1'bx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 1;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				OutWrite = 0;
			end
			
			5'b10110: begin // JAL
				HLT = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 1;
				RDiv = 0;
				WriteSrc = 1'bx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				OutWrite = 0;
			end
	
			5'b10111: begin // NOP
				HLT = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 1'bx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				OutWrite = 0;
			end
			
			5'b11000: begin // HLT
				HLT = 1;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 1'bx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				OutWrite = 0;
			end
			
		endcase
	
	end

endmodule