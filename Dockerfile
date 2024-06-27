FROM maven:3-openjdk-18 AS build

WORKDIR /app
COPY . .

RUN mvn clean package -DskipTests

FROM openjdk:18-jdk-slim
COPY --from=build /target/SmartContactManager-0.0.1-SNAPSHOT.jar SmartContactManager.jar

WORKDIR /app
EXPOSE 8082

ENTRYPOINT [ "java" , "-jar" , "SmartContactManager.jar"]

# # Use a base image with JDK 17
# FROM openjdk:17-jdk-slim

# # Set the working directory inside the container

# # Copy the JAR file from the host to the container
# COPY target/SmartContactManager-0.0.1-SNAPSHOT.jar app.jar

# # Expose the port that your Spring Boot application will run on
# EXPOSE 8082
# # Set the command to run the JAR file
# ENTRYPOINT ["java", "-jar", "app.jar"]

# # Start with a base image containing Java runtime
# FROM maven:3.8.3-openjdk-17 AS build
# COPY . .
# RUN mvn clean package -DskipTests

# FROM openjdk:17.0.1-jdk-slim
# COPY --from=build /target/SmartContactManager-0.0.1-SNAPSHOT.jar /SmartContactManager.jar
# EXPOSE 8082
# ENTRYPOINT ["java", "-jar", "SmartContactManager.jar"]