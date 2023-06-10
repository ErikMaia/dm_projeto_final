# Use a imagem base do SDK do .NET para construir o aplicativo
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app

# Copie os arquivos do projeto para o contêiner
COPY ./api ./


RUN dotnet ef migrations add Initial


# Execute as migrações
ENTRYPOINT [ "dotnet", "ef", "database", "update"]
