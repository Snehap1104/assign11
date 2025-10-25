# Use OpenJDK 21 slim image
FROM openjdk:21-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy all files from the repo to the container
COPY . .

# Compile the Java program
RUN javac src/HelloWorld.java

# Run the Java program
CMD ["java", "-cp", "src", "HelloWorld"]
