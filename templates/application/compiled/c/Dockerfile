FROM alpine:latest
RUN apk add --no-cache gcc musl-dev make
WORKDIR /app
CMD ["sh", "-ec", "if [ -f Makefile ]; then make -s; fi; if [ -f main ]; then ./main; fi; exec sh"]
