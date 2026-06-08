FROM alpine:latest
RUN apk add --no-cache lua
WORKDIR /app
CMD ["sh", "-ec", "if [ -f main.lua ]; then lua main.lua; fi; exec sh"]
