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

FROM maven:3-openjdk-18 AS build

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Build the application (skip tests)
RUN mvn clean package -DskipTests

# Define base image for runtime stage
FROM openjdk:18-jdk-slim

# Copy JAR file (update name if needed)
COPY --from=build /target/SmartContactManager.jar SmartContactManager.jar

# Expose port (needs mapping in Render)
EXPOSE 8082

# Define command to run the application
ENTRYPOINT [ "java" , "-jar" , "SmartContactManager.jar"]