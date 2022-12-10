pipeline {
    agent any
    tools{
        maven 'maven_3_5_0'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rahilnawab/CI']]])
                bat 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t rahilnawab/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'Dockerhub', variable: 'Dockerhub')]) {
                   bat 'docker login registry-1.docker.io -u rahilnawab -p ${Dockerhub}'

}
                   sh 'docker push rahilnawab/devops-integration'
                }
            }
        }
    }
}
