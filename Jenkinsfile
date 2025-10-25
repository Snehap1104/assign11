pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub'   // Jenkins credentials ID
        IMAGE_NAME = 'sneha2311/assign11'              // Replace with your DockerHub repo
    }

    stages {
        stage('Checkout') {
            steps {
                // ✅ Checkout from main branch
                git branch: 'main', url: 'https://github.com/Snehap1104/assign11.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // ✅ Windows Jenkins agent command
                    bat 'docker build -t %DOCKER_IMAGE%:latest .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // ✅ Safely use Jenkins credentials here
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        bat """
                            echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin
                            docker push %DOCKER_IMAGE%:latest
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
