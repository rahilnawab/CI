FROM openjdk:8
EXPOSE 8080
ADD target/devops-integration:83.jar devops-integration:83.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]