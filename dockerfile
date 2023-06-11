# Define a imagem base
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Copia os arquivos do projeto e restaura as dependências
COPY ./api/ ./
RUN dotnet restore

RUN dotnet tool install --global dotnet-ef --version 7.0.5

ENV PATH="$PATH:/root/.dotnet/tools"

RUN dotnet-ef migrations add InitialCreate2

ENTRYPOINT ["dotnet-ef", "database", "update"]