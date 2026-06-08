FROM alpine:latest
RUN apk add --no-cache g++ make
WORKDIR /app
CMD ["sh", "-ec", "if [ -f Makefile ]; then make -s; fi; if [ -f main ]; then ./main; fi; exec sh"]
