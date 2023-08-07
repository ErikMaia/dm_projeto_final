# Aplicativo de Viagens

Este é o repositório do aplicativo de viagens baseado em Flutter. O aplicativo permite aos usuários buscar e reservar viagens, além de fornecer informações em tempo real sobre as viagens, avaliações e muito mais.

## Executando a Aplicação

Siga as instruções abaixo para executar a aplicação em seu ambiente local.

### Pré-requisitos

Certifique-se de ter o seguinte software instalado em seu sistema:

- Docker
- Docker Compose
- Flutter SDK

### Passo 1: Clonar o Repositório

Clone este repositório para o seu ambiente local utilizando o seguinte comando:

```bash
git clone https://github.com/ErikMaia/dm_projeto_final.git dm
```


### Passo 2: Configurar o Docker Compose

Navegue até o diretório raiz do projeto clonado e abra o arquivo `docker-compose.yml` em um editor de texto. Verifique as configurações e ajuste conforme necessário, como as portas e variáveis de ambiente.

### Passo 3: Executar o Docker Compose

No diretório raiz do projeto, execute o seguinte comando para construir e iniciar os contêineres Docker:

```bash
docker-compose up --build -d
```

Isso criará os contêineres necessários para o backend da aplicação, como banco de dados e servidor.

### Passo 4: Executar o Aplicativo Flutter

Navegue até o diretório do aplicativo Flutter dentro do projeto clonado:

```bash
cd aplicativo-flutter
```
```bash
flutter run
```

Antes de executar o aplicativo Flutter, certifique-se de ter configurado corretamente o ambiente Flutter em seu sistema.

Execute o seguinte comando para iniciar o aplicativo:


