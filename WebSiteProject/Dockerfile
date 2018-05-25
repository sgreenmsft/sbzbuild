FROM microsoft/aspnetcore:2.0 AS base
WORKDIR /app
EXPOSE 20000

FROM microsoft/aspnetcore-build:2.0 AS build
WORKDIR /src
COPY WebSiteProject/WebSiteProject.csproj WebSiteProject/
RUN dotnet restore WebSiteProject/WebSiteProject.csproj
COPY . .
WORKDIR /src/WebSiteProject
RUN dotnet build WebSiteProject.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish WebSiteProject.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "WebSiteProject.dll"]