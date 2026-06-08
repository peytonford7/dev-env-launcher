FROM rust:1-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f Cargo.toml ]; then cargo run --quiet; elif [ -f main.rs ]; then rustc -O main.rs -o main && ./main; fi; exec sh"]
