# Step 1: Build JAR file
FROM maven:3.8.8-eclipse-temurin-17 AS builder
WORKDIR /app

# Copy project files
COPY . .

# Build the project & generate the JAR file
RUN mvn clean package -DskipTests

# Step 2: Run Spring Boot App
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/*.jar springboot-dock.jar

# Expose the application port
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "springboot-dock.jar"]
