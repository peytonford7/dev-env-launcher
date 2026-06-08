FROM node:26-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f requirements.txt ]; then xargs -r npm install < requirements.txt; fi; if [ -f index.js ]; then node index.js; fi; exec sh"]
