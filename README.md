# CI Project

This repository is for a Continuous Integration (CI) project. The main intent of this repository is to demonstrate the setup and operation of a CI pipeline, not to showcase complex Java code. Therefore, we are using a basic Java codebase for this project.

## Tools and Versions

The project utilizes the following tools:

- **Jenkins**: This is our continuous integration server that automates the building, testing, and deployment of applications. We're using version 2.361.1.
- **Jenkins Plugins**: These extend the functionality of Jenkins. We're using several plugins including:
  - All general plugins for a basic pipeline project
  - Credentials Binding Plugin
  - Credentials Plugin
  - Docker API Plugin
  - Docker Commons Plugin
  - Docker Pipeline
  - Docker plugin
  - Git
  - Git client
  - GitHub
  - GitHub API Plugin
  - GitHub Branch Source
  - Gradle
  - Image Tag Parameter Plugin (IMP for CD pipeline)
  - Maven Integration plugin
  - Pipeline
  - SnakeYAML API
- **Maven**: This is a build automation tool used primarily for Java projects.
- **Docker Desktop**: This provides Docker and Kubernetes functionalities on the desktop. Docker allows us to package our application into containers.

## CI Pipeline

Our CI pipeline consists of the following stages:

- **Maven Build**: In this stage, the pipeline first checks out the code from GitHub, then builds the code using Maven and creates a JAR file.
- **Building Image**: The pipeline packages the JAR file into a Docker image and tags it with the image tag parameter which is the git commit hash.
- **Push Image to DockerHUB**: The Docker image is then pushed to DockerHUB.
- **Signing out of DockerHUB**: Finally, the pipeline signs out of DockerHUB.

The CD repo for this project: https://github.com/rahilnawab/CD
