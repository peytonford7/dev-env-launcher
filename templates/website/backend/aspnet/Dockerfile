FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine
WORKDIR /app
ENV ASPNETCORE_URLS=http://0.0.0.0:80
EXPOSE 80
CMD ["sh", "-ec", "if [ -f app.csproj ]; then dotnet run --project app.csproj --urls \"$ASPNETCORE_URLS\"; fi; exec sh"]
