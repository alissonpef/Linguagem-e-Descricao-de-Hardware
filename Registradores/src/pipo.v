module pipo
(
	date,
	clk,
	clr,
	pr,
	D
);
	input clr, pr, date, clk;
	output D;
	
	wire a,b,c;
	
	flipflop U1(clr, date,	clk,	a);
	flipflop U2(clr, a,	clk,	b);
	flipflop U3(clr, b,	clk,	c);
	flipflop U4(clr, c,	clk,	D);
	
endmodule
