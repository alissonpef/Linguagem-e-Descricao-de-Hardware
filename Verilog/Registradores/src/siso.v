module siso
(
	t1,
	t2,
	clk,
	clr,
	A,
	B,
	C,
	D,
	QA,
	QB,
	QC,
	QD,
	S1,
	S0
);
	input clr, clk;
	input A,B,C,D;
	input S1, S0, t1, t2;
	output QA, QB,	QC, QD;
	reg r_nor1, r_nor2, r_nor3, r_nor4;
	
	always @(r_nor1 or r_nor2 or r_nor3 or r_nor4) begin
		r_nor1 = ~((~S1 & t1)|(~(~S1|~S0) & A)|(~S0 & QB));
		r_nor2 = ~((~S1 & QA)|(~(~S1|~S0) & B)|(~S0 & QC));
		r_nor3 = ~((~S1 & QB)|(~(~S1|~S0) & C)|(~S0 & QD));
		r_nor4 = ~((~S1 & QC)|(~(~S1|~S0) & D)|(~S0 & t2));
	end
	
	flipflop U1(~clr, r_nor1,	clk,	QA);
	flipflop U2(~clr, r_nor2,	clk,	QB);
	flipflop U3(~clr, r_nor3,	clk,	QC);
	flipflop U4(~clr, r_nor4,	clk,	QD);
	
	
endmodule
