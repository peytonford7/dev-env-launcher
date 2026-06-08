FROM golang:1.22-alpine
RUN apk add --no-cache make
WORKDIR /app
CMD ["sh", "-ec", "if [ -f Makefile ]; then make -s; elif [ -f main.go ]; then go build -o main main.go; fi; if [ -f main ]; then ./main; fi; exec sh"]
