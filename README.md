# CI Project

This is a GitHub repository for a continuous integration (CI) project that was done using the following tools and their versions:

- Jenkins version: 2.361.1
- Jenkins plugins:
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
- Git installed locally
- Maven
- Docker Desktop for Docker and Kubernetes
- Scoop to install HELM (https://scoop.sh/)

The project demonstrates how to set up a CI pipeline using Jenkins, Git, Maven, Docker, and Kubernetes. The pipeline consists of the following stages:

- Checkout: The pipeline checks out the code from the GitHub repository.
- Build: The pipeline builds the code using Maven and creates a JAR file.
- Package: The pipeline packages the JAR file into a Docker image and tags it with the image tag parameter which is the git commit hash.

The CD repo for this project: https://github.com/rahilnawab/CD




