module controle(
	 clk_i,
	 rst_i,
	 w_o
	
);

	input clk_i;
	input rst_i;
	output w_o;

wire [3:0] second_w;

datapath U0(
	.clk (clk_i), 
	.reset (rst_i),
	.count(second_w)
);

reg set_timer;
always @(second_w)
begin
	if (second_w == 4'b0101) set_timer <= 1;
	else set_timer <= 0;
end

//assign t_i = set_timer;
assign w_o = set_timer;

endmodule
