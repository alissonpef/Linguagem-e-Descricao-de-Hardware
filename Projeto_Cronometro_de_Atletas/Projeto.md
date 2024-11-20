# Projeto de Cronômetro em Verilog para FPGA Cyclone III

Este projeto foi desenvolvido como parte da disciplina de Linguagem de Descrição de Hardware. O cronômetro foi implementado em Verilog utilizando o ambiente Quartus Prime 13.1 e simulado no ModelSim. O projeto é destinado à FPGA Cyclone III.

## Descrição do Projeto

O projeto consiste em um cronômetro funcional que conta o tempo em segundos e minutos. Ele apresenta uma interface de usuário utilizando displays de sete segmentos para mostrar os dígitos do cronômetro.

## Funcionalidades Principais

1. **Contagem de Tempo:**
   - O cronômetro conta o tempo em segundos e minutos.
   - A contagem é exibida em quatro displays de sete segmentos.

2. **Debounce no Botão:**
   - Implementação de um debounce de 5 ms no botão, garantindo estabilidade na detecção de pressionamento.

## Configuração do Ambiente

- **Quartus Prime 13.1:**
  - O projeto foi desenvolvido e testado no ambiente Quartus Prime 13.1. Certifique-se de configurar o ambiente de desenvolvimento para a versão especificada.

- **ModelSim:**
  - Utilizado para simulação do projeto. Os testbenches estão incluídos no repositório.

## Estrutura do Repositório

- **`src/`:**
  - Contém os arquivos-fonte do projeto em Verilog.

- **`sim/`:**
  - Contém os arquivos de simulação, incluindo testbenches.

- **`prj/`:**
  - Contém os arquivos do gerais projeto.

## Como Usar o Projeto

1. Clone o repositório para o ambiente de desenvolvimento.

```bash
git clone https://github.com/AlehPF/Cronometro-em-FPGA.git
cd nome-do-repositorio
```

2. Abra o projeto no Quartus Prime 13.1 e compile-o.

3. Simule o projeto no ModelSim para verificar o comportamento.

4. Carregue o bitstream gerado na FPGA Cyclone III.

5. Observe o cronômetro em funcionamento nos displays de sete segmentos.

## Notas Adicionais

- Certifique-se de consultar a documentação do Quartus Prime 13.1 e da FPGA Cyclone III para configurações específicas.

- Reporte qualquer problema ou bug através das issues do GitHub.

Este projeto é uma implementação educacional e pode ser adaptado para atender às necessidades específicas do usuário. Sinta-se à vontade para explorar e modificar o código conforme necessário.

## Autores

- Alisson Pereira Ferreira (Matrícula: 22250769, E-mail: alissonpef@gmail.com)
- Sidnei de Souza Junior (Matrícula: 20150464, E-mail: sidneidesouzajunior@gmail.com)

--- 

**Universidade Federal de Santa Catarina**  

Curso: Engenharia de Computação  

Disciplina: Linguagem de Descrição de Hardware

Professor: Rodrigo Vinícius Mendonça Pereira.

