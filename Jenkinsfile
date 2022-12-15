pipeline {
    agent any
    parameters {
    string defaultValue: '0.1', name: 'Version'
	}
    tools{
        maven 'maven_3_5_0'
    }
    environment {
      DOCKERHUB_CREDENTIALS = credentials('docker-pwd')
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rahilnawab/CI']]])
                bat 'mvn clean'
                bat 'mvn package'
		        bat 'mvn install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t ("rahilnawab/devops-integration:%BUILD_Number%") .'
                }
            }
        }
        stage('Push image to Hub'){
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
