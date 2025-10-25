pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub'   // Jenkins credentials ID
        IMAGE_NAME = 'sneha2311/assign11'              // Replace with your DockerHub repo
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Snehap1104/assign11.git'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        def app = docker.build("${IMAGE_NAME}:latest")
                        app.push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Docker image built and pushed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs for details."
        }
        always {
            echo "🧹 Cleaning up local Docker images..."
            script {
                sh 'docker system prune -f'
            }
        }
    }
}
