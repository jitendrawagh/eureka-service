# build stage
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests
 
 FROM eclipse-temurin:17-jdk
 
 #set working directory
 WORKDIR /app
 
 #Copy Jar file into conatainer
 COPY target/eureka-service-0.0.1-SNAPSHOT.jar app.jar
 
 EXPOSE 8761
 
 #Rune the jar
 
 ENTRYPOINT ["java", "-jar", "app.jar"]
