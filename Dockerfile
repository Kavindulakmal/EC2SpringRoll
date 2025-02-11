# Step 1: Build JAR file
FROM maven:3.8.8-eclipse-temurin-17 AS builder


WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Step 2: Create the final image
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/springboot-dock.jar springboot-dock.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "springboot-dock.jar"]
