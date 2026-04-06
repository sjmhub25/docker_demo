# STEP 1: Compile the code
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app

# Copy your source files
COPY . .

# Compile the code
# (Assuming your main file is Main.java)
RUN javac a.java

# STEP 2: Run the code
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the compiled .class files from the builder
COPY --from=builder /app/*.class .

# Run the app
CMD ["java", "a"]
