FROM node:26-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f requirements.txt ]; then xargs -r npm install < requirements.txt; fi; if [ -f vite.config.js ]; then npx vite --host 0.0.0.0 --port 3000; fi; exec sh"]
