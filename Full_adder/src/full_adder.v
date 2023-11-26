module full_adder(input a, input b, input cin, output sum, output carry);
	// wire cria variaveis 
	// VARIAVEIS
	wire	s1;
	wire	c1; 
	wire	c2;
	
	//PROCESSO
	half_adder	HA1(a, b, s1, c1);
	half_adder	HA2(s1, cin, sum, c2);
	
	assign carry = c1 | c2;
	
endmodule
