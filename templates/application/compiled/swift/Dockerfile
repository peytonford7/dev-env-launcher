FROM swift:5.10-jammy
RUN apt-get update && apt-get install -y --no-install-recommends make && rm -rf /var/lib/apt/lists/*
WORKDIR /app
CMD ["sh", "-ec", "if [ -f Makefile ]; then make -s; fi; if [ -f main ]; then ./main; fi; exec sh"]
