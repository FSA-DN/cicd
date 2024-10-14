# Use the official OpenJDK 21 base image
FROM openjdk:21-jdk-slim AS build

# Set the working directory
WORKDIR /app

# Copy the Maven pom.xml and the source code
COPY pom.xml .
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Use a new image for the runtime
FROM openjdk:21-jre-slim

# Set the working directory
WORKDIR /app

# Copy the built jar file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your application runs on (default for Spring Boot is 8080)
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
