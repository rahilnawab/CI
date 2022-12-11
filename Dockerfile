FROM openjdk:8
EXPOSE 8080
ADD target/devops-integration:82.jar devops-integration:82.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]