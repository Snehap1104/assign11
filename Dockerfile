# OpenJDK 21 runtime
FROM openjdk:22-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy all files into container
COPY . /app

# Compile Java source code
RUN javac src/com/Main.java

# Run the Java program
CMD ["java", "-cp", "src", "Main"]
