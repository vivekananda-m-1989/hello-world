# ========================
# 1️⃣ Build stage
# ========================
FROM maven:3.9.9-eclipse-temurin-17-alpine AS build

WORKDIR /app

# Copy pom.xml first (for better layer caching)
COPY pom.xml .
COPY server/pom.xml server/pom.xml
COPY webapp/pom.xml webapp/pom.xml

# Download dependencies (cached layer)
RUN mvn -B dependency:go-offline

# Copy the rest of the source code
COPY . .

# Build the JAR
RUN mvn clean install -DskipTests


# ========================
# 2️⃣ Runtime stage
# ========================
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copy ONLY the built jar from build stage
COPY --from=build /app/webapp/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
