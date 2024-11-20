module flag_circuit(
	Sum,
	Carry_out,
	N,
	C,
	V,
	Z    
);

	parameter NIB = 4;

	input wire [NIB-1:0]Sum;
   input wire Carry_out;

   output reg N;
   output reg C;
   output reg V;
   output reg Z;


always @(Sum or Carry_out) begin
    //Negative Flag
    if(Sum & Carry_out) N <= 1;
    else N <= 0;

    //Carry Flag
    if(Carry_out) C <= 1;
    else C <= 0;

    //Overflow Flag
    if((~Sum ^ Carry_out) | (Sum ^ Carry_out)) V <= 1;
    else V <= 0;

    //Zero Flag
    if(~Sum & ~Carry_out) Z <= 1;
    else Z <= 0;
end
    

endmodule
