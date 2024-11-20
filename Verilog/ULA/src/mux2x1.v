/*
ESTE EXEMPLO DESCREVE UM MULTIPLEXADOR 
COM DUAS PORTAS DE ENTRADA, SELETOR DE 
UM BIT (2^n POSSIBILIDADES) E UMA SAÍDA
*/
module mux2x1
(
	input wire [3:0]a, 
	input wire [3:0]b, 
	input wire sel,
	
	output reg [3:0]op
);

// PROCESSO QUE OBSERVA QUALQUER 
// MUDANÇA NOS SINAIS a or b or sel
always @(a or b or sel) // EXEMPLO COMPORTAMENTAL
begin
  if (sel == 1'b1)
    op = a;
  else
    op = b;
end

endmodule