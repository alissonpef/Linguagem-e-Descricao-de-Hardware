module mealy ( level, clock, reset, tick);
// codificação dos estados
localparam [1:0] ZERO = 2'b00, 
	EDGE = 2'b01,
	ONE = 2'b10;

// vetores dos estados
reg [1:0] state, next_state;

input level, clock, reset;

output reg tick;

// processo sequencial estados
always @ (posedge clock) begin
	if (reset) state <= ZERO;
	else state <= next_state;
end
// Processo combinacional
// para o próximo estado
always @ (level or state) 
begin
	next_state = state;
	case (state)
	ZERO: if (level == 1 ) next_state = ONE;
	ONE: if (level == 0) next_state = ZERO;
	endcase
end
// decode output 
always @ (state) 
begin
	case (state)
	ZERO: tick = 1;
	ONE:tick = 0;
	endcase
end
endmodule

