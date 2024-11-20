# Projeto de Cronômetro em Verilog para FPGA Cyclone III

Este repositório contém o código-fonte do **Projeto de Cronômetro em Verilog**, desenvolvido como parte da disciplina de **Linguagem de Descrição de Hardware** na **Universidade Federal de Santa Catarina (UFSC)**. O cronômetro foi implementado utilizando **Verilog** para ser executado na **FPGA Cyclone III** e foi simulado no **ModelSim**.

## Descrição do Projeto

O projeto é um **cronômetro digital** que conta o tempo em **segundos** e **minutos**, exibindo os valores em **displays de sete segmentos**. Ele foi projetado para ser executado em uma **FPGA Cyclone III** e simulado utilizando o **Quartus Prime 13.1**.

## Funcionalidades Principais

1. **Contagem de Tempo:**
   - O cronômetro conta o tempo em **segundos** e **minutos**, atualizando o display a cada segundo.
   - O tempo é exibido em **quatro displays de sete segmentos** (dois para os minutos e dois para os segundos).

2. **Debounce no Botão:**
   - Implementação de um **debounce** de **5 ms** para garantir a estabilidade na detecção de pressionamentos de botão, evitando leituras incorretas.

## Configuração do Ambiente

### **Quartus Prime 13.1:**
- O projeto foi desenvolvido e testado no **Quartus Prime 13.1**. Certifique-se de configurar o ambiente de desenvolvimento para a versão indicada.

### **ModelSim:**
- O **ModelSim** foi utilizado para simular o projeto. Os **testbenches** estão incluídos no repositório, facilitando a validação do comportamento esperado.

## Estrutura do Repositório

- **`src/`:**
  - Contém os arquivos-fonte do projeto em **Verilog**.

- **`sim/`:**
  - Contém os arquivos de **simulação**, incluindo os **testbenches** utilizados para testar o cronômetro.

- **`prj/`:**
  - Contém os arquivos gerais do **projeto**, como a configuração do Quartus e o script de compilação.

## Como Usar o Projeto

1. **Clone o repositório:**
   - Clone o repositório para o seu ambiente de desenvolvimento.

   ```bash
   git clone https://github.com/AlehPF/Cronometro-em-FPGA.git
   cd Cronometro-em-FPGA
   ```

2. **Abra o Projeto:**
   - Abra o projeto no **Quartus Prime 13.1**.

3. **Compile o Projeto:**
   - Compile o projeto no **Quartus Prime** para gerar o bitstream.

4. **Simule no ModelSim:**
   - Simule o projeto no **ModelSim** utilizando os testbenches fornecidos para verificar o comportamento.

5. **Carregue o Bitstream na FPGA:**
   - Carregue o bitstream gerado na **FPGA Cyclone III**.

6. **Observe o Cronômetro em Funcionamento:**
   - Observe o funcionamento do cronômetro nos displays de sete segmentos, que irão mostrar os **minutos** e **segundos**.

## Notas Adicionais

- **Documentação:** Consulte a documentação do **Quartus Prime 13.1** e da **FPGA Cyclone III** para obter informações sobre configurações específicas e como carregar o bitstream na FPGA.

- **Problemas e Bugs:** Se você encontrar problemas, reporte-os utilizando a seção de **issues** no GitHub.

Este projeto é uma implementação educacional que pode ser adaptada para outras plataformas FPGA ou modificada conforme as necessidades do usuário.

## Autores

- **Alisson Pereira Ferreira** (Matrícula: 22250769, E-mail: alissonpef@gmail.com)  
- **Sidnei de Souza Junior** (Matrícula: 20150464, E-mail: sidneidesouzajunior@gmail.com)

---

**Universidade Federal de Santa Catarina**  
**Curso:** Engenharia de Computação  
**Disciplina:** Linguagem de Descrição de Hardware  
**Professor:** Rodrigo Vinícius Mendonça Pereira

Este projeto foi desenvolvido como uma atividade prática, visando aplicar os conceitos de **Linguagem de Descrição de Hardware (HDL)**, como **Verilog**, em um **projeto de cronômetro** utilizando uma **FPGA Cyclone III**.
