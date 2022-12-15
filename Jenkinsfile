pipeline {
    agent any
    tools{
        maven 'maven_3_5_0'
    }
    environment {
      DOCKERHUB_CREDENTIALS = credentials('dockerhub-pwd')
    }
    stages{
        stage('Building project'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rahilnawab/CI']]])
                bat 'mvn clean'
                bat 'mvn package'
		        bat 'mvn install'
            }
        }
        stage('Building docker image'){
            steps{
                script{
                    bat 'docker build rahilnawab/devops-integration:%BUILD_Number% .'
                }
            }
        }
        stage('Uploading image to DockerHub'){
            steps {
              bat '''
                docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW
                docker push rahilnawab/devops-integration
                docker logout
              '''
           }
        }
    }
}
