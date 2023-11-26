module bit4_adder(sum, a, b, carry_out, 
  carry_in
);
parameter N = 4;
output wire [N-1:0]sum;
output carry_out;

input  wire [N-1: 0] a, b;
input carry_in;

wire w_carry_out_0, w_carry_out_1, w_carry_out_2; 

full_adder U1(.a(a[0]), .b(b[0]), .sum(sum[0]), .cin(carry_in), .carry(w_carry_out_0));
full_adder U2(.a(a[1]), .b(b[1]), .sum(sum[1]), .cin(carry_in), .carry(w_carry_out_0));
full_adder U3(.a(a[2]), .b(b[2]), .sum(sum[2]), .cin(carry_in), .carry(w_carry_out_0));
full_adder U4(.a(a[3]), .b(b[3]), .sum(sum[3]), .cin(carry_in), .carry(w_carry_out_0));

endmodule

