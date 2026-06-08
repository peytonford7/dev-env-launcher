FROM alpine:latest
RUN apk add --no-cache perl
WORKDIR /app
CMD ["sh", "-ec", "if [ -f main.pl ]; then perl main.pl; fi; exec sh"]
