FROM maven:3.9.9-eclipse-temurin-17-alpine AS build
WORKDIR /app

COPY . .
RUN mvn -B -pl webapp -am clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# webapp builds a WAR (because webapp/pom.xml has <packaging>war</packaging>)
COPY --from=build /app/webapp/target/*.war app.war

EXPOSE 8080

# NOTE: A WAR is not always runnable with `java -jar` unless it's a Spring Boot executable war.
ENTRYPOINT ["java","-jar","app.war"]
