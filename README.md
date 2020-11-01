# Exemplos

Projeto Flutter inicialmente concebido para agrupar diversos exemplos vistos em cursos, hoje, foca em acessibilidade e usabilidade.
  
[![GitHub issues](https://img.shields.io/github/issues/MatheusSchipper/flutter_examples?color=blue&style=for-the-badge)](https://github.com/MatheusSchipper/flutter_examples/issues)

[![GitHub pulls](https://img.shields.io/badge/PR-Welcome-blue?style=for-the-badge)](https://github.com/MatheusSchipper/flutter_examples/pulls)


Status do projeto: Em desenvolvimento.

### Objetivos

Com esse projeto, quero aprender cada dia mais sobre como tornar aplicações móveis acessíveis a todos, para isso, estou buscando materiais e guias. Como comecei a pouco a estudar sobre o assunto, adorarei receber dicas sobre o que posso melhorar, corrigir e implementar. Espero um dia conseguir entregar uma aplicação que realmente seja acessível a todos, que possa servir de exemplo para outras pessoas e me aprofundar mais e mais no assunto.

### Features

O projeto conta, no momento, com 6 exemplos básicos desenvolvidos em Flutter. Nesses 6 exemplos, implementarei as seguintes funcionalidades visando acessibilidade e usabilidade: Tema claro/escuro, textos auxiliares para leitores de tela(testes feitos com o TalkBack do Android) e utilização com fontes grandes(Teste realizado em um Moto G5S Plus). 
  
1 - Feature concluída
- [x] Contador de pessoas
- [x] Calculadora de IMC
- [x] Conversor de Moedas
- [x] Lista de tarefas
- [x] Buscador de Gifs
- [x] Lista de contatos

2 - Aplicação de tema claro/escuro

- [x] Contador de pessoas
- [x] Calculadora de IMC
- [x] Conversor de Moedas
- [ ] Lista de tarefas
- [ ] Buscador de Gifs
- [ ] Lista de contatos

3 - Inserção de textos para leitores de tela

- [x] Contador de pessoas
- [x] Calculadora de IMC
- [x] Conversor de Moedas
- [ ] Lista de tarefas
- [ ] Buscador de Gifs
- [ ] Lista de contatos

4 - Utilização com fontes grandes 

- [x] Contador de pessoas
- [x] Calculadora de IMC
- [x] Conversor de Moedas
- [ ] Lista de tarefas
- [ ] Buscador de Gifs
- [ ] Lista de contatos

### Pré-requisitos

Para rodar essa aplicação, você deverá ter instalado o [Flutter](https://flutter.dev/docs/get-started/install). Ao instalar o Flutter e rodar em um terminal o comando ``` flutter doctor ``` serão fornecidas informações sobre o status do flutter, se há algo a ser instalado ainda ou se está tudo ok. Eu utilizo o [VS Code](https://code.visualstudio.com/download) com as seguintes extensões: [Flutter](https://github.com/Dart-Code/Flutter), [Dart](https://github.com/Dart-Code/Dart-Code), além de outras para facilitar o desenvolvimento. Pode-se se utilizar também o [Android Studio](https://developer.android.com/studio?hl=pt-br) para rodar a aplicação.

#### Dependências

 - Utilizando o VS Code com as extensões Flutter e Dart: 
Será aberto um popup no canto inferior, perguntando se você deseja buscar os pacotes utilizados no projeto. Ao clicar em sim, os pacotes serão baixados e as dependências serão resolvidas.
    * Pode-se também resolver as dependências utilizando o comando ``` flutter pub get``` no Terminal do VS Code.

#### Resolvendo o problema Target of URI doesn't exist: 'package:examples/core/utils/keys.dart'.

Para resolver esse problema, você deve criar um arquivo .dart na pasta lib/core/utils com o nome keys.dart e inserir o seguinte conteúdo: ```const String giphyKey = "<API_KEY>"; ```. Para conseguir a API_KEY, você deve seguir o tutorial(em inglês) do [GIPHY](https://developers.giphy.com/docs/api#quick-start-guide). Após receber a API_KEY, voce deve trocar o conteúdo <API_KEY> pela sua API_KEY.

### Tecnologias

 - [Flutter](https://flutter.dev/)
 
 
### Telas de exemplo da aplicação
 - Tela inicial (Tema claro)
<img src="https://github.com/MatheusSchipper/flutter_examples/blob/main/screenshots/HomePage_LightTheme.png" width="300" alt="Imagem da tela inicial do projeto, que possui um cabeçalho na cor laranja com o texto 'Exemplos' na cor preta, além de um ícone de um círculo de duas cores, que é responsável pelo controle do tema claro/escuro, seguido de uma lista de botões na cor laranja claro com os exemplos criados. A cor de fundo da tela é na cor laranja, num tom entre o laranja do cabeçalho e o dos botões. Os textos e ícones estão na cor preta.">

 - Tela inicial (Tema escuro)
<img src="https://github.com/MatheusSchipper/flutter_examples/blob/main/screenshots/HomePage_DarkTheme.png" width="300" alt="Imagem da tela inicial do projeto, que possui um cabeçalho na cor preta com o texto 'Exemplos' na cor laranja, além de um ícone de um círculo de duas cores, que é responsável pelo controle do tema claro/escuro, seguido de uma lista de botões na cor preta  com os exemplos criados. A cor de fundo da tela é na cor cinza escuro. Os textos dos botões estão na cor branca e os ícones na cor laranja claro.">

 - Tela Contador de pessoas (Tema claro)
<img src="https://github.com/MatheusSchipper/flutter_examples/blob/main/screenshots/PeopleCounter_LightTheme.png" width="300" alt="Imagem da tela Contador de Pessoas, que possui um cabeçalho na cor laranja com o texto 'Contador de pessoas' na cor preta, seguido de um texto introdutório e um cartão com a quantidade de pessoas, além de dois botões para incrementar (+1) e decrementar(-1) o número de pessoas (nessa imagem, há 0 pessoas). O botão -1 está desabilitado e está na cor cinza com o texto na cor preta. O botão +1 está habilitado e está na cor laranja claro com o texto na cor preta.">

 - Tela Contador de pessoas (Tema escuro)
<img src="https://github.com/MatheusSchipper/flutter_examples/blob/main/screenshots/PeopleCounter_DarkTheme.png" width="300" alt="Imagem da tela Contador de Pessoas, que possui um cabeçalho na cor preta com o texto 'Contador de pessoas' na cor laranja, seguido de um texto introdutório e um cartão com a quantidade de pessoas, além de dois botões para incrementar (+1) e decrementar(-1) o número de pessoas (nessa imagem, há 0 pessoas). O botão -1 está desabilitado e está na cor cinza com o texto na cor laranja claro. O botão +1 está habilitado e está na cor preta com o texto na cor laranja claro.">

 - Tela Calculadora de IMC (Tema claro)
<img src="https://github.com/MatheusSchipper/flutter_examples/blob/main/screenshots/BMICalculator_LightTheme.png" width="300" alt="Imagem da tela Calculadora de IMC, que possui um cabeçalho na cor laranja com o texto 'Calculadora de IMC' na cor preta, além de um ícone de atualizar, na cor preta, que serve para apagar os valores dos campos Peso e Altura, seguido de um ícone de uma balança na cor preta, campos para pareenchimento de Peso e Altura e um botão na cor laranja claro com o texto 'Calcular', na cor preta, para realizar o cálculo. Abaixo do botão é mostrado o texto 'Informe seus dados' na cor preta, que é atualizado para o resultado do IMC após o cálculo. A cor de fundo da tela é um tom de laranja, mais claro que o tom do cabeçalho e mais forte que o tom da cor dos botões.">

 - Tela Calculadora de IMC (Tema escuro)
<img src="https://github.com/MatheusSchipper/flutter_examples/blob/main/screenshots/BMICalculator_DarkTheme.png" width="300" alt="Imagem da tela Calculadora de IMC, que possui um cabeçalho na cor preta com o texto 'Calculadora de IMC', na cor laranja, além de um ícone de atualizar, na cor laranja, que serve para apagar os valores dos campos Peso e Altura, seguido de um ícone de uma balança na cor laranja, campos para pareenchimento de Peso e Altura e um botão na cor preta com o texto 'Calcular', na cor laranja claro, para realizar o cálculo. Abaixo do botão é mostrado o texto 'Informe seus dados' na cor laranja, que é atualizado para o resultado do IMC após o cálculo. A cor de fundo da tela é cinza.">

### Autor
Desenvolvido por Matheus Schipper. Quaisquer dúvidas/reclamações/sugestões, entre em contato comigo!

[![Linkedin Badge](https://img.shields.io/badge/-Matheus_Schipper-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/matheusschipper/)](https://www.linkedin.com/in/matheusschipper/)
