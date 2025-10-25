# Use a smaller, Alpine-based image
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

COPY . .

RUN javac src/HelloWorld.java

CMD ["java", "-cp", "src", "HelloWorld"]
