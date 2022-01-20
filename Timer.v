module Timer(CLK, Reset, PREEMP_ON, PREEMP_OFF, IO, Finalize, OutOfQuantum);
	input Reset, CLK, PREEMP_ON, PREEMP_OFF, Finalize;
	input [1:0]IO;
	output reg OutOfQuantum;
	
	parameter QUANTUM_SIZE = 5, QUANTUM = 20;
	reg [QUANTUM_SIZE-1:0] count;
	reg preempState;
	
	always @ (posedge CLK) begin
		if(Reset)
			preempState = 0;
		
		if(PREEMP_ON == 1) begin
			preempState = 1;
			count = 0;
		end
		if(PREEMP_OFF == 1)
			preempState = 0;
		
		if(preempState == 1 && IO[0] == 0 && IO[1] == 0) begin
			if(Finalize == 1)
				count = 0;
			count = count + 1;
			if(count == QUANTUM)
				OutOfQuantum = 1;
			else
				OutOfQuantum = 0;
		end

	end
endmodule