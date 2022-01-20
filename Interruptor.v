module Interruptor(CLK, PC, IO, Button, OutOfQuantum, Finalize, interr, interrAddr);
	input CLK, Button, OutOfQuantum, Finalize;
	input [1:0] IO;
	input [31:0] PC;
	output reg interr;
	output reg [31:0] interrAddr;
	parameter PREEMP_INST_ADDR = 0, NEXT_PROG_ADDR = 0;
	
	always @ (posedge CLK)
	begin
		if(OutOfQuantum) begin 
			interr = 1;
			interrAddr = PREEMP_INST_ADDR;
		end
		
		else if(IO == 2'b10 || IO == 2'b01) begin
			interr = 1;
			interrAddr = PC;
			if(Button == 0)
				interr = 0;
		end
		
		else if(Finalize) begin
			interr = 1;
			interrAddr = NEXT_PROG_ADDR;
		end
		
		else 
			interr = 0;
	end
	
endmodule