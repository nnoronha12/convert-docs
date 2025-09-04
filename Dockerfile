FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y git openjdk-17-jdk maven && \
    apt-get clean

# Clone Stirling PDF
RUN git clone https://github.com/Stirling-Tools/Stirling-PDF.git /app

# Build Stirling PDF with Maven
WORKDIR /app
RUN mvn clean install -DskipTests

# Expose the port Stirling PDF runs on
EXPOSE 8080

# Run the app
CMD ["java", "-jar", "target/StirlingPDF.jar"]
