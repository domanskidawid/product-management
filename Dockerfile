FROM openjdk:11.0.1-jre-slim-stretch
VOLUME /target
COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
