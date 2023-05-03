# Base image
FROM --platform=linux/amd64 openjdk:19-jdk-alpine

# Install Maven
RUN apk update && apk add --no-cache maven

# Create and set the working directory
RUN mkdir -p /app
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy the source code to the container
COPY src/ ./src/

# Build the application
RUN mvn package -Dmaven.test.skip

# Copy the JAR file to the container
#COPY target/demo-1.0.0.jar demo-1.0.0.jar

# Expose the port that the app will run on
EXPOSE 8080

USER 10014
# Set the command to run the app
CMD ["java", "-jar", "target/demo-1.0.0.jar"]
