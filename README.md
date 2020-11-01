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
 
### Autor
---
Desenvolvido por Matheus Schipper. Quaisquer dúvidas/reclamações/sugestões, entre em contato comigo!

[![Linkedin Badge](https://img.shields.io/badge/-Matheus_Schipper-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/matheusschipper/)](https://www.linkedin.com/in/matheusschipper/)
