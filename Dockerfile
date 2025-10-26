# Use a small Alpine-based image with JDK 21
FROM eclipse-temurin:21-jdk-alpine

# Set working directory
WORKDIR /app

# Copy the application code
COPY . .

# Compile the Java program
RUN javac src/HelloWorld.java

# Run the program
CMD ["java", "-cp", "src", "HelloWorld"]
