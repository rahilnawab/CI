FROM openjdk:8
WORKDIR /
ADD target/*.jar /devops-integration.jar
EXPOSE 8080
CMD ["java","-jar","/devops-integration.jar"]
