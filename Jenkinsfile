pipeline {
    agent any
    tools{
        maven 'maven_3_5_0'
    }
    environment {
      DOCKERHUB_CREDENTIALS = credentials('dockerhub-pwd')
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
                    bat 'docker build -t rahilnawab/devops-integration:${env.BUILD_NUMBER} .'
                }
            }
        }
        stage('Push image to Hub'){
            steps {
              bat '''
                docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW
                docker push rahilnawab/devops-integration-${Version}
                docker logout
              '''
           }
        }
    }
}
