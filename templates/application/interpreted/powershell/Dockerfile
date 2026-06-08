FROM mcr.microsoft.com/powershell:alpine
WORKDIR /app
CMD ["pwsh", "-NoLogo", "-Command", "if (Test-Path /app/main.ps1) { & /app/main.ps1 }; pwsh -NoLogo"]
