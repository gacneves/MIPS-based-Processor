// Quartus Prime Verilog Template
// Single port RAM with single read/write address 

module RAM_Dados
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=10)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, nativeCLK, CLK,
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	always @ (negedge CLK)
	begin
		// Write
		if (we)
			ram[addr] <= data;
	end
	
	always @ (posedge nativeCLK)
	begin
		q <= ram[addr];
	end

endmodule
