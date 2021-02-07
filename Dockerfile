FROM openjdk:11.0.2-jre-stretch

VOLUME /tmp

COPY target/crm-*.jar app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
