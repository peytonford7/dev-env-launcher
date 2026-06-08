FROM node:26-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f requirements.txt ]; then xargs -r npm install < requirements.txt; fi; if [ -f angular.json ]; then npx ng serve --host 0.0.0.0 --port 80; fi; exec sh"]
