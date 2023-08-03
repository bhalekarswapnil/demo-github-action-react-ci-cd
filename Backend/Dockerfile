FROM  openjdk:8-jdk-alpine

WORKDIR /app


COPY target/example.smallest-0.0.1-SNAPSHOT.war /app/app.war

EXPOSE 8080

CMD ["java", "-jar", "app.war"]


