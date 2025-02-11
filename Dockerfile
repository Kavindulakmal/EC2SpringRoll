#Use a Base Image with JDK 17 runtime
FROM openjdk:17-jdk-slim

#Set the Working Directory
WORKDIR /app

#Copy the application JAR file into the Container
COPY target/springboot-dock.jar springboot-dock.jar

#Expose the Required port
EXPOSE 8081

#Run the application
ENTRYPOINT ["java", "-jar", "springboot-dock.jar"]