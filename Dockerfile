FROM maven:3.9.9-eclipse-temurin-17-alpine AS build
WORKDIR /app

COPY . .

# Debug: show what actually got copied
RUN echo "=== /app contents ===" && ls -la && \
    echo "=== /app/webapp contents ===" && ls -la webapp || true && \
    echo "=== show root pom ===" && sed -n '1,60p' pom.xml && \
    echo "=== show webapp pom ===" && sed -n '1,60p' webapp/pom.xml

# IMPORTANT: force Maven to use the root parent POM
RUN mvn -B -f /app/pom.xml -pl webapp -am clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# If webapp is WAR (your current pom says war), copy WAR:
COPY --from=build /app/webapp/target/*.war app.war

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.war"]
