`timescale 10us/100ns
module full_adder_tb;
 
reg r_A, r_B, r_c;
wire r_OUT, w_OUT; 

integer TIME_COUNT = 0;
  
full_adder DUT(.a  (r_A), 	.b  (r_B),	.cin (r_c),	.sum(r_OUT),	.carry(w_OUT)); 

// PROCESSO 1
initial
begin
    r_A = 1'b0;    r_B = 1'b0;    r_c = 1'b0; #1
    r_A = 1'b0;    r_B = 1'b1;    r_c = 1'b0; #1
    r_A = 1'b1;    r_B = 1'b0;    r_c = 1'b0; #1
    r_A = 1'b1;    r_B = 1'b1;    r_c = 1'b0; #1
    r_A = 1'b0;    r_B = 1'b0;    r_c = 1'b1; #1
    r_A = 1'b0;    r_B = 1'b1;    r_c = 1'b1; #1
    r_A = 1'b1;    r_B = 1'b0;    r_c = 1'b1; #1
    r_A = 1'b1;    r_B = 1'b1;    r_c = 1'b1; #1;
end

// PROCESSO 2
always @(r_A or r_B or r_c)
begin
  $display ("r_A %b", r_A);
  $display ("r_B %b", r_B);
  $display ("r_C %b", r_c);
  $display ("r_OUT %b", r_OUT);
  $display ("w_OUT %b", w_OUT);
  $display ("TIME_COUNT %d", TIME_COUNT);
end
  
  
endmodule
