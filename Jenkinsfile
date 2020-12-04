pipeline {
  environment {
    registry = "jbaltar/simplilearn-devops-certification-training-project"
    registryCredential = 'jbaltar-dockerhub'
  }
  agent any
  stages {
        stage('Building image ') {
        steps{
            echo "-----------------------------------------------------------------------------------------------------------------"
            echo "Starting Building Image"
            echo "-----------------------------------------------------------------------------------------------------------------"
            script {
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
        }
        }

        stage('Deploy Image') {
        steps{
            echo "-----------------------------------------------------------------------------------------------------------------"
            echo "Starting Deploying Image"
            echo "-----------------------------------------------------------------------------------------------------------------"
            script {
            docker.withRegistry( '', 'jbaltar-dockerhub' ) {
                dockerImage.push()
            }
            }
        }
        }

        stage('Remove Image') {
        steps{
            echo "-----------------------------------------------------------------------------------------------------------------"
            echo "Starting Removing Image"
            echo "-----------------------------------------------------------------------------------------------------------------"
            
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
        }
   }   
}

node {
    stage('Execute Image'){
        def customImage = docker.build("jbaltar/simplilearn-devops-certification:${env.BUILD_NUMBER}")
        customImage.inside {
            sh 'echo This is the code executing inside the container.'
        }
    }
}
