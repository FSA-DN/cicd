# Use the official Maven image as a parent image
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file
COPY pom.xml .

# Copy the project source
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# Use OpenJDK for running the application
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Specify the command to run on container start
CMD ["java", "-jar", "app.jar"]
