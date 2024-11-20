`timescale 1ns/1ps

module tb_cronometro;

  // Parametros do test bench
  reg clkin;
  reg reset;
  reg hold;

  // Saidas do test bench
  wire [6:0] disp1, disp2, disp3, disp4;

  // Instancia do modulo cronometro
  cronometro uut (
    .clkin(clkin),
    .reset(reset),
    .hold(hold),
    .disp1(disp1),
    .disp2(disp2),
    .disp3(disp3),
    .disp4(disp4)
  );

  // Geracao de clock
  initial begin
    clkin = 0;
    forever #5 clkin = ~clkin;
  end

  // Teste basico
  initial begin
    // Inicializacoes
    reset = 1;
    hold = 0;
    #10 reset = 0;

    // Espera um pouco
    #100;

    // Ativa o cronometro
    hold = 1;

    // Simulacao por um tempo
    #5000;

    // Desativa o cronometro
    hold = 0;

    // Simulacao por mais um tempo
    #5000;
  end

endmodule

