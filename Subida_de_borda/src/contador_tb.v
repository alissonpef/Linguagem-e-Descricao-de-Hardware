`timescale 1ms/100us

module contador_tb;

	reg reg_clk;
	reg reg_reset;
	wire [3:0] w_count;
	
	integer i;
	
	datapath DUT (
		.clk(reg_clk),
		.reset(reg_reset),
		.count(w_count)
	);
	
	
	
	/*
	task clkTick;
	begin
		#100 reg_clk = ~reg_clk;
		#100 reg_clk = ~reg_clk;
	end
	endtask
	*/
	
	initial begin
		reg_clk = 1'b0;
		reg_reset = 1'b0;
	end
	
	
	always #(1) reg_clk = ~reg_clk;
	
	
	initial begin
	
		for ( i = 0 ; i < 5 ; i = i + 1 ) begin
			if ( reg_reset == 1'b1 )
				if ( (i%10) !==  w_count ) 
					$display("Error on time %g: i = %d, w_count =%d.", $time, (i%10), w_count);
			else if ( reg_reset == 1'b0 )
				if ( w_count !== 4'b0000 )
					$display("Error on time %g: i = %d, w_count =%d.", $time, (i%10), w_count);
			//clkTick;
		end
		
		#300 reg_reset = 1'b1;
		
		for ( i = 0 ; i < 18 ; i = i + 1 ) begin
			if ( reg_reset == 1'b1 )
				if ( (i%10) !==  w_count ) 
					$display("Error on time %g: i = %d, w_count =%d.", $time, (i%10), w_count);
			else if ( reg_reset == 1'b0 )
				if ( w_count !== 4'b0000 )
					$display("Error on time %g: i = %d, w_count =%d.", $time, (i%10), w_count);
			//clkTick;
		end
		
		#300 reg_reset = 1'b0;
		
		for ( i = 0 ; i < 15 ; i = i + 1 ) begin
			if ( reg_reset == 1'b1 )
				if ( (i%10) !==  w_count ) 
					$display("Error on time %g: i = %d, w_count =%d.", $time, (i%10), w_count);
			else if ( reg_reset == 1'b0 )
				if ( w_count !== 4'b0000 )
					$display("Error on time %g: i = %d, w_count =%d.", $time, (i%10), w_count);
			//clkTick;
		end
		
		#300 reg_reset = 1'b1;
		
		for ( i = 0 ; i < 25 ; i = i + 1 ) begin
			if ( reg_reset == 1'b1 )
				if ( (i%10) !==  w_count ) 
					$display("Error on time %g: i = %d, w_count =%d.", $time, (i%10), w_count);
			else if ( reg_reset == 1'b0 )
				if ( w_count !== 4'b0000 )
					$display("Error on time %g: i = %d, w_count =%d.", $time, (i%10), w_count);
			//clkTick;
		end
		
		$display("Fim do testbench.");
		
		$stop;
		
	end
	
endmodule
