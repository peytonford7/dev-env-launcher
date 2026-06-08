FROM maven:3.9-eclipse-temurin-21-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f pom.xml ]; then mvn -q spring-boot:run; fi; exec sh"]
