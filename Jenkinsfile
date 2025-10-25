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
        
        stage('Clean Docker Cache') {
            steps {
                script {
                    bat '''
                        docker rmi %IMAGE_NAME%:latest || echo "Image not found, skipping removal"
                        docker builder prune -f
                    '''
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build --no-cache -t %IMAGE_NAME%:latest ."
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: 'dockerhub', 
                        usernameVariable: 'DOCKER_USER', 
                        passwordVariable: 'DOCKER_PASS'
                    )]) {
                        bat '''
                            echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin
                            docker push %IMAGE_NAME%:latest
                            docker logout
                        '''
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
        always {
            bat 'docker logout || echo "Already logged out"'
        }
    }
}
