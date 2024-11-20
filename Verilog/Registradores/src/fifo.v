module fifo(
	data_in, 
	wr_en, 
	rd_en, 
	reset, 
	clock, 
	data_out, 
	f_full, 
	f_empty
	);
	
	parameter DWIDTH = 4;
	parameter AWIDTH = 4;
	
	input data_in, wr_en, rd_en, reset, clock;
	output data_out, f_full, f_empty;
	
	reg [DWIDTH-1:0] mem [0:2**AWIDTH-1];
	// ponteiros
	reg [AWIDTH-1:0] wr_ptr;
	reg [AWIDTH-1:0] rd_ptr;
	// track última operação
	reg last_was_write;

	assign f_full = (rd_ptr == wr_ptr && last_was_write);
	assign f_empty = (rd_ptr == wr_ptr && !last_was_write);
	// output
	assign data_out = mem[rd_ptr];

	always @ (posedge clock or posedge reset) begin
		if (reset) begin
			rd_ptr <= 0;
			wr_ptr <= 0;
			last_was_write <= 0; // nonblocking
		end
		else begin
			if (wr_en && !f_full) begin
				mem[wr_ptr] <= data_in;
				wr_ptr <= wr_ptr + 1;
			end
			if (rd_en && !f_empty) begin
				rd_ptr <= rd_ptr + 1; 
			end
			last_was_write <= wr_en; // track last operation
		end
	end

endmodule

