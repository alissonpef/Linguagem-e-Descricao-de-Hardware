module sevenseg (
    input [3:0] sw, // A entrada dos segmentos 
    output reg [6:0] sevenseg // Saida dos segmentos do display 
);

    // Bloco always que atualiza os segmentos com base na entrada sw
    always @(sw) // Acionado sempre que houver mudança na entrada SW
        case (sw) // Lista de verificação
		  // Cada entrada / Respectiva saída 
            4'd0: sevenseg = 7'b1000000; // Representação do número 0, apenas segmento g ativo
            4'd1: sevenseg = 7'b1111001; // Representação do número 1
            4'd2: sevenseg = 7'b0100100; // Representação do número 2
            4'd3: sevenseg = 7'b0110000; // Representação do número 3
            4'd4: sevenseg = 7'b0011001; // Representação do número 4
            4'd5: sevenseg = 7'b0010010; // Representação do número 5
            4'd6: sevenseg = 7'b0000010; // Representação do número 6
            4'd7: sevenseg = 7'b1111000; // Representação do número 7
            4'd8: sevenseg = 7'b0000000; // Representação do número 8
            4'd9: sevenseg = 7'b0011000; // Representação do número 9
            default: sevenseg = 7'b1111111; // Valor padrão para outros casos (todos os segmentos acesos) / ERRO
        endcase
endmodule
