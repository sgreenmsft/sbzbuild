FROM microsoft/aspnetcore:2.0 AS base
WORKDIR /app
EXPOSE 20003

FROM microsoft/aspnetcore-build:2.0 AS build
WORKDIR /src
COPY WebAPIProject/WebAPIProject.csproj WebAPIProject/
RUN dotnet restore WebAPIProject/WebAPIProject.csproj
COPY . .
WORKDIR /src/WebAPIProject
RUN dotnet build WebAPIProject.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish WebAPIProject.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "WebAPIProject.dll"]