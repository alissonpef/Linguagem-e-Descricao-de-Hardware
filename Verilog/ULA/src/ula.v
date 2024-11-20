module ula(
	input wire [3:0]a, 
	input wire [3:0]b, 
	input wire a_inv,
	input wire b_inv,
	input wire c_in,	
	input wire [1:0]alu_op,
	output [3:0]ALU_out,
	output N, 
	output C, 
	output V, 
	output Z
);

wire [3:0]a_out;
wire [3:0]b_out;
wire carry;
wire [3:0]or_var;
wire [3:0]and_var;
wire [3:0]xor_var;

wire [3:0]sum;

mux2x1 M1(a,~a,a_inv, a_out);
mux2x1 M2(b,~b,b_inv, b_out);

assign and_var = a_out & b_out;
assign or_var = a_out | b_out;
assign xor_var = a_out ^ b_out;

bit4_adder BI(sum, a, b, carry, c_in);

mux2x2 MM(and_var, or_var, xor_var, sum, alu_op, ALU_out);

flag_circuit FLC(sum, carry, N, C, V, Z);

endmodule
