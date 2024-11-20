module flipflop
(
	clr,
	J,
	clk,
	Q
);
	input clr, clk;
	input J;
	output Q;
	
	reg r_nand1, r_nand2, r_nand3, r_nand4;

	always @(posedge clk) begin
		r_nand1 = ~(J & r_nand3);
		r_nand2 = ~(~J & r_nand4);
		r_nand3 = ~(r_nand1 & r_nand4);
		r_nand4 = ~(r_nand2 & r_nand3 & clr);
	end
	
	assign Q = r_nand3;
	
endmodule
