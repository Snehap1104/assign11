# Build stage
FROM openjdk:17-slim AS build
WORKDIR /app
COPY src/ ./src/
RUN javac src/*.java

# Run stage
FROM openjdk:17-slim
WORKDIR /app
COPY --from=build /app/src /app/src
CMD ["java", "-cp", "src", "HelloWorld"]
