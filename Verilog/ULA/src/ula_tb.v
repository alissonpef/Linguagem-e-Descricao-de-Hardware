module ula_tb;

reg clk_tb;

parameter NIB = 4;

reg [NIB-1:0]r_a;
reg [NIB-1:0]r_b;
reg r_a_inv;
reg r_b_inv;
reg r_c_in;
reg [1:0]r_alu_op;
wire [NIB-1:0]w_ALU_out;
wire w_N;
wire w_C; 
wire w_V; 
wire w_Z;

parameter period = 50; 

initial 
begin
	clk_tb = 0; 
end

always #(period) clk_tb = ~clk_tb;
//always #(period) clk_tb <= ~clk_tb;
ula ULA(.a(r_a), .b(r_b), .a_inv(r_a_inv), .b_inv(r_b_inv), .c_in(r_c_in), .alu_op(r_alu_op), .ALU_out(w_ALU_out), .N(w_N), .C(w_C), .V(w_V), .Z(w_Z));

initial
begin
	r_a = 4'b1000;	r_b = 4'b0000;	r_a_inv = 0;	r_b_inv = 0;	r_c_in = 1'b0; r_alu_op = 2'b00;
	@(negedge clk_tb);
	r_a = 4'b0101;	r_b = 4'b0001;	r_a_inv = 0;	r_b_inv = 1;	r_c_in = 1'b0; r_alu_op = 2'b01;
	@(negedge clk_tb);
	r_a = 4'b0001;	r_b = 4'b1111;	r_a_inv = 1;	r_b_inv = 0;	r_c_in = 1'b1; r_alu_op = 2'b10;
	@(negedge clk_tb);
	r_a = 4'b0000;	r_b = 4'b0100;	r_a_inv = 1;	r_b_inv = 1;	r_c_in = 1'b1; r_alu_op = 2'b11;
	
	@(negedge clk_tb);
	r_a = 4'b0001;	r_b = 4'b0001;	r_a_inv = 0;	r_b_inv = 0;	r_c_in = 1'b1; r_alu_op = 2'b00;
	@(negedge clk_tb);
	r_a = 4'b0000;	r_b = 4'b0010;	r_a_inv = 0;	r_b_inv = 1;	r_c_in = 1'b1; r_alu_op = 2'b01;
	@(negedge clk_tb);
	r_a = 4'b0000;	r_b = 4'b0001;	r_a_inv = 1;	r_b_inv = 0;	r_c_in = 1'b0; r_alu_op = 2'b10;
	@(negedge clk_tb);
	r_a = 4'b0001;	r_b = 4'b0101;	r_a_inv = 1;	r_b_inv = 1;	r_c_in = 1'b0; r_alu_op = 2'b11;

	@(negedge clk_tb);
	r_a = 4'b0000;	r_b = 4'b0000;	r_a_inv = 0;	r_b_inv = 0;	r_c_in = 1'b0; r_alu_op = 2'b00;
	@(negedge clk_tb);
	r_a = 4'b0001;	r_b = 4'b0001;	r_a_inv = 1;	r_b_inv = 1;	r_c_in = 1'b1; r_alu_op = 2'b01;
	@(negedge clk_tb);
	r_a = 4'b0001;	r_b = 4'b0001;	r_a_inv = 0;	r_b_inv = 0;	r_c_in = 1'b0; r_alu_op = 2'b10;
	@(negedge clk_tb);
	r_a = 4'b1111;	r_b = 4'b1111;	r_a_inv = 1;	r_b_inv = 1;	r_c_in = 1'b1; r_alu_op = 2'b11;
	
	@(negedge clk_tb);
	r_a = 4'b0000;	r_b = 4'b0000;	r_a_inv = 0;	r_b_inv = 0;	r_c_in = 1'b0; r_alu_op = 2'b00;	

end

always @(r_a or r_b or r_a_inv or r_b_inv or r_c_in or r_alu_op)
begin
  $display ("r_a %b", r_a);
  $display ("r_b %b", r_b);
  $display ("r_a_inv %b", r_a_inv);
  $display ("r_b_inv %b", r_b_inv);
  $display ("r_c_in %b", r_c_in);
  $display ("r_alu_op %b", r_alu_op);
  $display ("w_ALU_out %b", w_ALU_out);
  $display ("w_N %b", w_N);
  $display ("w_C %b", w_C);
  $display ("w_V %b", w_V);
  $display ("w_Z %b", w_Z);
end

initial #1300 $stop;

endmodule


