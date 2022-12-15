pipeline {
    agent any
    tools{
        maven 'maven_3_5_0'
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
                    bat 'docker build -t rahilnawab/devops-integration:%BUILD_Number% .'
                }
            }
        }
        stage('Uploading image to DockerHub'){
            steps {
              withCredentials([usernamePassword(credentialsId: 'dockerhub-pwd', passwordVariable: 'DOCKERHUB_CREDENTIALS_PSW', usernameVariable: 'DOCKERHUB_CREDENTIALS_USR')]) {
                bat '''
                    docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW
                    docker push rahilnawab/devops-integration:%BUILD_Number%
                '''
                }
           }
        }
        stage('Logging off dockerhub'){
            steps {
              bat 'docker logout'
           }
        }
    }
}
