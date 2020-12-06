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
            echo "Starting Building Image "
            echo "-----------------------------------------------------------------------------------------------------------------"
            script {
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
        }
        }

        stage('Deploy Image to Docker Hub Repository') {
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
    
        stage('Pull Image') {
        steps{
            echo "-----------------------------------------------------------------------------------------------------------------"
            echo "Starting Pulling Image"
            echo "-----------------------------------------------------------------------------------------------------------------"
            script {
            docker.withRegistry( '', 'jbaltar-dockerhub' ) {
                dockerImage.pull()
            }
            }
        }
        }
    
   }   
}

node {
    stage('Execute Image'){
        echo "-----------------------------------------------------------------------------------------------------------------"
        echo "Starting Running Application"
        echo "-----------------------------------------------------------------------------------------------------------------"
        def customImage = docker.build("jbaltar/simplilearn-devops-certification:${env.BUILD_NUMBER}")
        customImage.inside {
            sh 'python /tmp/script.py'
        }
    }
}
