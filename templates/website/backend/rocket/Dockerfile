FROM rust:1-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f Cargo.toml ]; then cargo run --release; fi; exec sh"]
