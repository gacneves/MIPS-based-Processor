module DivisaoCasas(NUM, C, D, U);

	input [9:0] NUM;
	output reg [3:0] C, D, U;
	integer i;
	
	always @(NUM) begin
		C = 4'b0000;
		D = 4'b0000;
		U = 4'b0000;
	
		for(i = 9; i >= 0; i = i - 1) begin
			if(C >= 5)
				C = C + 3;
			if(D >= 5)
				D = D + 3;
			if(U >= 5)
				U = U + 3;
			
			C = C << 1;
			C[0] = D[3];
			D = D << 1;
			D[0] = U[3];
			U = U << 1;
			U[0] = NUM[i];
		end
	end
	
endmodule
	