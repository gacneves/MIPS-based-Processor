module MuxInstCtrl(CLK, Reset, InstDst, InstBIOS, InstMem, ResetPC, InstructionSelect);
	input CLK, Reset, InstDst;
	input [31:0] InstBIOS, InstMem;
	output reg ResetPC;
	output [31:0] InstructionSelect;
	reg MemCtrl;
	
	initial begin
		MemCtrl = 0;
		ResetPC = 0;
	end
	
	always @ (posedge CLK) begin
		if (Reset) begin
			MemCtrl <= 0;
			ResetPC <= 1;
		end
		else begin
			if (InstDst && MemCtrl == 0) begin
				MemCtrl <= 1;
				ResetPC <= 1;
			end
			else
				ResetPC <= 0;
		end
	end
	
	assign InstructionSelect = (MemCtrl == 0) ? InstBIOS : InstMem;
	
endmodule