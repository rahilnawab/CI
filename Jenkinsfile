pipeline {
    agent any
    tools{
        maven 'maven_3_5_0'
    }
    environment {
      registry = "rahilnawab/devops-integration"
      registryCredential = 'dockerhub-pwd'
	  tag = bat(script: """git log --format="medium" -1 ${GIT_COMMIT}""", returnStdout:true).trim()
    }
    stages{
        stage('Building project'){
            steps{
			    echo "commit=${GIT_COMMIT}"
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
        stage('Push image to DockerHUB'){
            steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            bat '''
                docker push rahilnawab/devops-integration:%BUILD_Number%
                docker logout
              '''
                    }   
                }
            }
        }
    }
}

