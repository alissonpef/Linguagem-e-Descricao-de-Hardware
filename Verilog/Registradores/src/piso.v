module piso
(
	date,
	clk,
	clr,
	A,
	B,
	C,
	D
);
	input clr, date, clk;
	output A,B,C,D;
	
	
	flipflop U1(clr, date,	clk,	A);
	flipflop U2(clr, A,	clk,	B);
	flipflop U3(clr, B,	clk,	C);
	flipflop U4(clr, C,	clk,	D);
	
	
endmodule
