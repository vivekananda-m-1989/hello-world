FROM maven:3.9.9-eclipse-temurin-17-alpine AS build
WORKDIR /app

COPY . .
RUN mvn -B -pl webapp -am clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/webapp/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
