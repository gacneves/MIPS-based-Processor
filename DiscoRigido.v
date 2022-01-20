// Quartus Prime Verilog Template
// Single port hd with single read/write address 

module DiscoRigido
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=15, parameter TRILHAS=16, parameter SETORES=2048)
(
	input [(DATA_WIDTH-1):0] data, trilha, setor,
	input we, nativeCLK, CLK,
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the hd variable
	reg [(DATA_WIDTH-1):0] HD[(2**ADDR_WIDTH-1):0];

	localparam HD_SIZE = 2**ADDR_WIDTH/TRILHAS;


	
	always @ (negedge CLK)
	begin
		// Write
		if (we)
			HD[trilha * HD_SIZE + setor] <= data;
	end
	
	always @ (posedge nativeCLK)
	begin
		q <= HD[trilha * HD_SIZE + setor];
	end

endmodule
