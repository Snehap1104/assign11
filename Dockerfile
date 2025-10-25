# Use OpenJDK image
FROM openjdk:17-jdk-slim

# Create app directory
WORKDIR /app

# Copy source code
COPY src /app/src

# Compile the Java file
RUN javac src/HelloWorld.java

# Set the entry point
CMD ["java", "-cp", "src", "HelloWorld"]
