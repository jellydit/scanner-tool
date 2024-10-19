FROM openjdk:11-jre-slim
WORKDIR /app
COPY controller.jar .
# GUI = 8080 | Crawlers = 8081
EXPOSE 8080 8081
ENTRYPOINT ["java", "-jar", "controller.jar"]
