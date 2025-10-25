FROM openjdk:21-jdk-slim

WORKDIR /app

# Copy everything
COPY . .

# Compile Java code
RUN javac src/com/HelloWorld.java

# Run the program
CMD ["java", "-cp", "src", "com.Main"]
