
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Code retrieved from GitHub successfully!'
            }
        }

        stage('Check Terraform') {
            steps {
                sh 'terraform -version'
            }
        }

        stage('Terraform Format Check') {
            steps {
                dir('terraform') {
                    sh 'terraform fmt -check'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init -input=false'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }
    }
}
