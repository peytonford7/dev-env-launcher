FROM node:26-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f requirements.txt ]; then xargs -r npm install < requirements.txt; fi; if [ -f package.json ]; then npx next dev -H 0.0.0.0 -p 3000; fi; exec sh"]
