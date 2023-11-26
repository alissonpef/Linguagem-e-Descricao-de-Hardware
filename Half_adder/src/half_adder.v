module half_adder
(
	input a,
	input b,

	output wire saida_soma,
	output wire saida_carry
	);	
	
	xor SOMA(saida_soma, a, b);
	and CARRY(saida_carry, a, b);
	//outra forma de fazer o half_adder
	//assign saida_soma = a ^ b;
	//assign saida_carry = a & b;
endmodule
