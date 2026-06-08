FROM alpine:latest
RUN apk add --no-cache mono mono-mcs make
WORKDIR /app
CMD ["sh", "-ec", "if [ -f Makefile ]; then make -s; fi; if [ -f main.exe ]; then mono main.exe; fi; exec sh"]
