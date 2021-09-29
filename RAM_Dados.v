module RAM_Dados
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=5)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, clk,
	output [(DATA_WIDTH-1):0] q
);
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	initial 
	begin : INIT
		integer i;
		for(i = 0; i < 2**ADDR_WIDTH; i = i + 1)
			ram[i] = {DATA_WIDTH{1'b0}};
	end 

	always @ (negedge clk)
	begin
		if (we)
			ram[addr] <= data;
	end

	assign q = ram[addr];

endmodule
