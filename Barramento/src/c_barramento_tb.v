module c_barramento_tb;

reg clk_tb;

reg DATA_VALID;
wire DATA_READ;
reg [7:0]DATA;
reg [7:0]BUFFER_LOCAL;
reg reset;
parameter period=50; 

initial 
begin
	clk_tb = 0; 
end

always #(period) clk_tb = ~clk_tb;


initial
begin
	reset = 1;
	DATA_VALID = 0;
	#10;
	@(negedge clk_tb);
		reset = 0;
		DATA_VALID = 1;
		DATA = 8'h15;
	@(negedge DATA_READ);
		BUFFER_LOCAL = DATA;
		DATA = 8'h0;
		DATA_VALID = 0;
		#200;
	@(negedge clk_tb);
		DATA_VALID = 1;
		DATA = 8'h15;
	@(negedge DATA_READ);
		BUFFER_LOCAL = DATA;
		DATA = 8'h0;
		DATA_VALID = 0;
end

c_barramento CB(.clk(clk_tb), .reset(reset), .data_valid(DATA_VALID), .data(DATA), .data_read(DATA_READ));

always@ (posedge clk_tb)
begin 
	if(clk_tb == 1) BUFFER_LOCAL = DATA;
	else DATA = BUFFER_LOCAL;
end
//initial #1600 $stop;

endmodule


