FROM openjdk:11.0.1-jre-slim-stretch
VOLUME /product-management
COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
