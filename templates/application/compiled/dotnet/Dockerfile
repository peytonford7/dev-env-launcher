FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine
RUN apk add --no-cache make
WORKDIR /app
CMD ["sh", "-ec", "if [ -f Makefile ]; then make -s; elif [ -f app.csproj ]; then dotnet build -c Release -o out; fi; if [ -f out/app.dll ]; then dotnet out/app.dll; fi; exec sh"]
