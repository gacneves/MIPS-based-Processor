module DivFreq(CLK,OUT);
input CLK;
output reg OUT;
reg [25:0] CONT;
always @ (posedge CLK)
if(CONT==26'd10000000)
	begin
		CONT <= 26'd0;
		OUT<=1;
	end
else
	begin
		CONT<=CONT+1;
		OUT<=0;
	end
endmodule