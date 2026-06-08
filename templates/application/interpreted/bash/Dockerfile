FROM alpine:latest
RUN apk add --no-cache bash
WORKDIR /app
CMD ["sh", "-ec", "if [ -f script.sh ]; then bash script.sh; fi; exec sh"]
