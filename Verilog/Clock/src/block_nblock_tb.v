module block_nblock_tb;

reg clk_tb;

reg we0;
reg [1:0] a0;
reg [7:0] d_i0;
reg [7:0] d_o0;
reg [7:0] mem0 [0:3];

reg we1;
reg [1:0] a1;
reg [7:0] d_i1;
reg [7:0] d_o1;
reg [7:0] mem1 [0:3];

parameter period=50; 

initial 
begin
	clk_tb = 0; 
end

always #(period) clk_tb = ~clk_tb;
//always #(period) clk_tb <= ~clk_tb;

initial
begin
	we0 = 0;
	a0 = 2'b01;
	d_i0 = 11;
	@(negedge clk_tb);
	we0 = 1;
	a0 = 2'b01;
	d_i0 = 22;
	@(negedge clk_tb);
	we0 = 0;
	a0 = 2'b01;
	d_i0 = 33;
	@(negedge clk_tb);
	we0 = 0;
	a0 = 2'b01;
	d_i0 = 44;
end

always@ (posedge clk_tb)
begin 
	if(we0 == 1) mem0[a0] = d_i0;
	else d_o0 = mem0 [a0];
end

initial
begin
	we1 = 0;
	a1 = 2'b01;
	d_i1 = 11;
	@(negedge clk_tb);
	we1 = 1;
	a1 = 2'b01;
	d_i1 = 22;
	@(negedge clk_tb);
	we1 = 0;
	a1 = 2'b01;
	d_i1 = 33;
	@(negedge clk_tb);
	we1 = 0;
	a1 = 2'b01;
	d_i1 = 44;
end

//always@ (posedge clk_tb)
//begin 
//	if(we1 == 1) mem1[a1] = d_i1;
//	else d_o1 = mem1 [a1];
//end


always@ (posedge clk_tb) begin
if (we == 1) begin
    mem_bloq[a] = d_i; // BLOQUEANTE - OCORRE SEMPRE QUE WE É 1
    mem_nbloq[a] <= d_i; // NÃO-BLOQUEANTE - OCORRE SEMPRE QUE WE É 1
end

    d_o_bloq = mem_bloq[a];       // BLOQUEANTE - OBRIGATORIAMENTE ESSA LINHA SEMPRE                                                                      OCORRE - INDEPENDENTE DO IF
    d_o_nbloq <= mem_nbloq[a]; // NÃO-BLOQUEANTE - OBRIGATORIAMENTE ESSA LINHA SEMPRE                                                            OCORRE - INDEPENDENTE DO IF
end

initial #200 $stop;

endmodule

