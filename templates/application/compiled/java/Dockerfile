FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f Main.java ]; then javac Main.java; fi; if [ -f Main.class ]; then java Main; fi; exec sh"]
