pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub'    // Jenkins credentials ID
        IMAGE_NAME = 'sneha2311/assign11'      // Docker Hub repository
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Snehap1104/assign11.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t %IMAGE_NAME%:latest ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        bat """
                            docker login -u %DOCKER_USER% -p %DOCKER_PASS%
                            docker push %IMAGE_NAME%:latest
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Docker image built and pushed successfully!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}
