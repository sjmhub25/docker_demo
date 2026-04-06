# Use the full JDK to compile
FROM openjdk:17-jdk-slim AS builder
WORKDIR /app

# Copy your source code into the container
COPY . .

# Compile all Java files
# This creates .class files
RUN javac *.java

# Use a lighter image to run the app
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the compiled .class files from the builder stage
COPY --from=builder /app/*.class .

# Run the main class (Replace 'Main' with your actual filename)
CMD ["java", "a"]