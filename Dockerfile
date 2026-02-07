# Use a lightweight JRE for the final image
FROM eclipse-temurin:17-jre-jammy

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR from the local target folder to the container
# Replace 'sample-app-1.0.jar' with your actual artifact name
COPY target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

