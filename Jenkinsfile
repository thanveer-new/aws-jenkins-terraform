
pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        AWS_REGION = 'ap-south-1'
    }

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

        stage('AWS Authentication and Terraform Plan') {
            steps {
                withCredentials([
                    string(
                        credentialsId: 'aws-access-key-id',
                        variable: 'AWS_ACCESS_KEY_ID'
                    ),
                    string(
                        credentialsId: 'aws-secret-access-key',
                        variable: 'AWS_SECRET_ACCESS_KEY'
                    )
                ]) {
                    dir('terraform') {
                        sh 'aws sts get-caller-identity'
                        sh 'terraform plan -input=false -no-color'
                    }
                }
            }
        }
    }
}
