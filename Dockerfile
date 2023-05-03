# Base image
FROM --platform=linux/amd64 openjdk:19-jdk-alpine

# Create and set the working directory
RUN mkdir -p /app
WORKDIR /app

# Copy the JAR file to the container
COPY target/demo-1.0.0.jar demo-1.0.0.jar

# Expose the port that the app will run on
EXPOSE 8080

USER 10014
# Set the command to run the app
CMD ["java", "-jar", "demo-1.0.0.jar"]
