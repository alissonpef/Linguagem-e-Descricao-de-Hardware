module cronometro (
    input clkin,            // Sinal de clock de entrada
    input reset,            // Sinal de reset
    input hold,             // Sinal de hold para controlar a contagem
    output [6:0] disp1,     // Saida para o display 1 (menos significativo)
    output [6:0] disp2,     // Saida para o display 2
    output [6:0] disp3,     // Saida para o display 3
    output [6:0] disp4      // Saida para o display 4 (mais significativo)
);

    // Declaracao de fios e registradores para controle de clock e contagem
    wire clk_5khz;          // Sinal de clock de 5 kHz
    reg cont;               // Registrador de controle para alternar a contagem
    reg [15:0] cont2;       // Registrador de contagem secundario de 16 bits

    pll_counter pll_counter_inst (
        .inclk0 ( clkin ),
        .c0 ( clk_5khz )
    );

    // Registradores para o cronometro e digitos individuais
    reg [15:0] cronometro; // Cada parte do tempo teria 32 bits / Para ir de segundo em segundo
    reg [3:0] us, ds, um, dm;  // Registradores de 4 bits para os digitos de segundo e minuto

    // Bloco always acionado na borda de subida do sinal de clock
    always @(posedge clk_5khz) begin
        if (reset == 1'b0) begin
            // Reinicializa todos os digitos quando o sinal de reset esta ativo
            us = 4'd0;
            ds = 4'd0;
            um = 4'd0;
            dm = 4'd0;
            cont = 1'b0;  
        end

        // Verifica se contagem de cont2 atingiu 2500 para atualizar o cont2, ele sera usado para dar um delay no botao
        if (cont2 == 16'd2_500) begin
            cont2 = 15'd0;
            // Verifica se o sinal de hold esta desativado para alternar o sinal de cont
            if (hold == 1'b0) begin
                cont = ~cont;
            end
        end
        else begin
            // Incrementa o valor do cronometro em 1
            cont2 = cont2 + 15'd1;
        end

        // Verifica se o sinal de hold esta ativo, indicando que o cronometro deve ser incrementado
        if (cont == 1'b1) begin
            // Verifica se o cronometro atingiu o valor 100.000 (26 bits)
            if (cronometro == 16'd50_000) begin
                // Se o cronometro atingiu 100.000, reinicia o cronometro para 0
                cronometro = 15'd0;
                // Incrementa o digito das unidades de segundo (us) em 1
                us = us + 4'd1;
            end
            // Caso o sinal de hold esteja ativo, mas o cronometro nao atingiu 100.000
            else begin
                // Incrementa o valor do cronometro em 1
                cronometro = cronometro + 15'd1;
            end

            // Logica de contagem para os digitos de segundo e minuto
            if (us > 4'd9) begin
                // Se o digito das unidades de segundo atingiu 10, reinicia para 0 e incrementa o digito das dezenas de segundo
                us = 4'd0;
                ds = ds + 4'd1;

                // Verifica se o digito das dezenas de segundo atingiu 6 (60 segundos), reinicia para 0 e incrementa o digito das unidades de minuto
                if (ds > 4'd5) begin
                    ds = 4'd0;
                    um = um + 4'd1;

                    // Verifica se o digito das unidades de minuto atingiu 10, reinicia para 0 e incrementa o digito das dezenas de minuto
                    if (um > 4'd9) begin 
                        um = 4'd0;
                        dm = dm + 4'd1;

                        // Verifica se o digito das dezenas de minuto atingiu 6 (60 minutos), reinicia para 0
                        if (dm > 4'd5) begin
                            dm = 4'd0;
                        end
                    end
                end
            end
        end
    end

    // Quatro instancias do modulo 'sevenseg' para converter os digitos em segmentos
    sevenseg display1 (
        .sw(us),          // A entrada para o primeiro display de sete segmentos e o digito das unidades de segundo
        .sevenseg(disp1)  // A saida do primeiro display de sete segmentos e conectada a variavel disp1
    );

    sevenseg display2 (
        .sw(ds),          // A entrada para o segundo display de sete segmentos e o digito das dezenas de segundo
        .sevenseg(disp2)  // A saida do segundo display de sete segmentos e conectada a variavel disp2
    );

    sevenseg display3 (
        .sw(um),          // A entrada para o terceiro display de sete segmentos e o digito das unidades de minuto
        .sevenseg(disp3)  // A saida do terceiro display de sete segmentos e conectada a variavel disp3
    );

    sevenseg display4 (
        .sw(dm),          // A entrada para o quarto display de sete segmentos e o digito das dezenas de minuto
        .sevenseg(disp4)  // A saida do quarto display de sete segmentos e conectada a variavel disp4
    );

endmodule
