# FROM maven:3-openjdk-18 AS build

# COPY . .

# RUN mvn clean package -DskipTests

# FROM openjdk:18-jdk-slim
# COPY --from=build /target/SmartContactManager-0.0.1-SNAPSHOT.jar SmartContactManager.jar

# EXPOSE 8082

# ENTRYPOINT [ "java" , "-jar" , "SmartContactManager.jar"]

# # Use a base image with JDK 17
# FROM openjdk:17-jdk-slim

# # Set the working directory inside the container
# WORKDIR /app

# # Copy the JAR file from the host to the container
# COPY target/SmartContactManager-0.0.1-SNAPSHOT.jar app.jar

# # Expose the port that your Spring Boot application will run on
# EXPOSE 8082
# # Set the command to run the JAR file
# ENTRYPOINT ["java", "-jar", "app.jar"]

# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8082


# Add the application's jar to the container
ADD target/SmartContactManager-1.0.0.jar app.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
