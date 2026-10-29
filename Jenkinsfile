
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'GitHub Jenkinsfile loaded successfully!'
            }
        }

        stage('Check Terraform') {
            steps {
                sh 'terraform -version'
            }
        }
    }
}
