pipeline {
    agent any
    tools{
        maven 'maven_3_5_0'
    }
    environment {
      registry = "rahilnawab/devops-integration"
      registryCredential = 'dockerhub-pwd'
      HASH = GIT_COMMIT.take(7)
    }
    stages{
        stage('Maven Build'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rahilnawab/CI']]])
                bat 'mvn clean'
                bat 'mvn package'
		bat 'mvn install'
            }
        }
        stage('Building image'){
            steps{
                script{
                    bat 'docker build -t rahilnawab/devops-integration:%HASH% .'
                }
            }
        }
        stage('Push image to DockerHUB'){
            steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            bat ' docker push rahilnawab/devops-integration:%HASH%'
                    }   
                }
            }
        }
        stage('Signing out of dockerhub '){
            steps{
         script {
            bat 'docker logout' 
                }
            }
        }
    }
}

