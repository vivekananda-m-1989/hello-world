# Use official OpenJDK 17 image as base image

FROM maven:3.9.9-eclipse-temurin-17-alpine AS build
 
# Set working directory

WORKDIR /app
 
# Copy the jar built by Maven/Gradle

COPY target/*.jar app.jar
 
# Expose port (adjust if needed)

EXPOSE 8080
 
# Run the application

ENTRYPOINT ["java", "-jar", "app.jar"]
 
