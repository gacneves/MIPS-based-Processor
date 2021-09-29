module Debounce(IN,CLK,S);
input IN,CLK;
output S;
reg Q1,Q2,Q3;
always @(posedge CLK)
begin
	Q1<=IN;
	Q2<=Q1;
	Q3<=Q2;
end
assign S = Q1 & Q2 & Q3;
endmodule