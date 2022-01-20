module RAM_Instrucao
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=10)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] readAddr, writeAddr,
	input we, nativeCLK, CLK,
	output reg [(DATA_WIDTH-1):0] q
);

	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	
	always @ (negedge CLK)
	begin
		if (we)
			ram[writeAddr] <= data;
	end

	always @ (posedge nativeCLK)
	begin
		q <= ram[readAddr];
	end

endmodule
