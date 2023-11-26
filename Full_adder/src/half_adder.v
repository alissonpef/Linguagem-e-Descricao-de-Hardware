module half_adder(input a, input b, output sum, output carry);
	
	xor saida_da_soma(sum, a, b);
	and saida_do_carry(carry, a, b);
	
	//assign sum = a ^ b;
	//assign carry = a & b;
endmodule
