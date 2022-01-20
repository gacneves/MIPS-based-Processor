module UnidadeControle (OpCode, InstDst, InstWrite, Finalize, HLT, IO, RegDst, RegDst2, RegWrite, JLink, RDiv, WriteSrc, ExtentType, ALUsrc, ALUop, Jump, JumpR, MemWrite, MemtoReg, HdToReg,
 RegToHd, HdWrite, PreempON, PreempOFF);

	input [4:0] OpCode;
	output reg [3:0] ALUop;
	output reg [1:0] IO, WriteSrc;
	output reg InstDst, InstWrite, Finalize, HLT, RegDst, RegDst2, RegWrite, JLink, RDiv, ExtentType, ALUsrc, Jump, JumpR, MemWrite, MemtoReg, HdToReg, RegToHd, PreempON, PreempOFF, HdWrite;
	
	always @ (OpCode) begin

		case (OpCode)
			5'b00000: begin // ADD
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b00001: begin // SUB
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b00010: begin // MUL
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b00011: begin // DIV
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b00100: begin // NOT
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b00101: begin // AND
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b00110: begin // OR
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b00111: begin // XOR
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
	
			5'b01000: begin // SLT
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
	
			5'b01001: begin // SGT
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
	
			5'b01010: begin // JR
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
	
			5'b01011: begin // IN
				Finalize = 0;
				HLT = 0;
				IO = 2'b10;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'b01;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b01100: begin // OUT
				Finalize = 0;
				HLT = 0;
				IO = 2'b01;
				RegDst = 1'bx;
				RegDst2 = 1;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b01101: begin // ADDI
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
	
			5'b01110: begin // SUBI
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b01111: begin // BEQ
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 0;
				RegDst2 = 1;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 0;
				ALUsrc = 0;
				ALUop = 4'b1010;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b10000: begin // BNEQ
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 0;
				RegDst2 = 1;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 0;
				ALUsrc = 0;
				ALUop = 4'b1011;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b10001: begin // LW
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b10010: begin // SW
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 0;
				RegDst2 = 1;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 0;
				ALUsrc = 1;
				ALUop = 4'b0000;
				Jump = 0;
				JumpR = 0;
				MemWrite = 1;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
	
			5'b10011: begin // SR
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b10100: begin // SL
				Finalize = 0;
				HLT = 0;
				IO = 0;
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
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b10101: begin // J
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 1;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b10110: begin // JAL
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 1;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
	
			5'b10111: begin // NOP
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b11000: begin // HLT
				Finalize = 0;
				HLT = 1;
				IO = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b11001: begin // FINALIZE
				Finalize = 1;
				HLT = 0;
				IO = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b11010: begin // PREEMPON
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 1;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b11011: begin // PREEMPOFF
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 1;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b11100: begin // MEMCTRL
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 1'bx;
				RegDst2 = 1'bx;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 1;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b11101: begin // HDTOINST
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 1;
				HdWrite = 0;
				HdToReg = 0;
				RegToHd = 0;
			end
			
			5'b11110: begin // HDTOREG
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 1;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'b10;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 0;
				HdToReg = 1;
				RegToHd = 0;
			end
			
			5'b11111: begin // REGTOHD
				Finalize = 0;
				HLT = 0;
				IO = 0;
				RegDst = 0;
				RegDst2 = 0;
				RegWrite = 0;
				JLink = 0;
				RDiv = 0;
				WriteSrc = 2'bxx;
				ExtentType = 1'bx;
				ALUsrc = 1'bx;
				ALUop = 4'bxxxx;
				Jump = 0;
				JumpR = 0;
				MemWrite = 0;
				MemtoReg = 1'bx;
				PreempON = 0;
				PreempOFF = 0;
				InstDst = 0;
				InstWrite = 0;
				HdWrite = 1;
				HdToReg = 0;
				RegToHd = 1;
			end
			
		endcase
	
	end

endmodule