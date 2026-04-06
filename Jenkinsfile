pipeline {
    agent any

    environment {
        // Ensure this matches your Docker Hub username
        DOCKER_IMAGE = "sowjanya2510/app-image"
        // Name of the credentials entry you created in Jenkins
        DOCKER_CREDS_ID = 'dockerhub-creds' 
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/sjmhub25/docker_demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Use 'bat' for Windows. No plugin required for this.
                bat "docker build -t ${DOCKER_IMAGE}:latest ."
            }
        }

        stage('Login and Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKER_CREDS_ID}",
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    // Windows login and push syntax
                    bat "echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin"
                    bat "docker push ${DOCKER_IMAGE}:latest"
                }
            }
        }
    }

    post {
        success {
            echo 'Image successfully built and pushed to Docker Hub'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}
