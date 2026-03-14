FROM mcr.microsoft.com/powershell:latest

WORKDIR /app
CMD ["pwsh", "-Command", "if (Test-Path /app/main.ps1) { & /app/main.ps1 }"]
