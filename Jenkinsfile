pipeline {
    agent any
    parameters {
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Select the environment to deploy')
    }
    environment {
        AWS_CREDENTIALS = credentials('aws_credentials')
    }
    stages {
        stage('Initialize') {
            steps {
                script {
                    withEnv(["AWS_ACCESS_KEY_ID=${AWS_CREDENTIALS_USR}", "AWS_SECRET_ACCESS_KEY=${AWS_CREDENTIALS_PSW}"]) {
                        // Initialize Terraform
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Select Workspace') {
            steps {
                script {
                    // Select Terraform workspace based on provided parameter
                    sh "terraform workspace select ${params.ENV} || terraform workspace new ${params.ENV}"
                }
            }
        }
        stage('Apply') {
            steps {
                script {
                    withEnv(["AWS_ACCESS_KEY_ID=${AWS_CREDENTIALS_USR}", "AWS_SECRET_ACCESS_KEY=${AWS_CREDENTIALS_PSW}"]) {
                        // Apply Terraform configuration
                        sh "terraform apply -auto-approve --var-file ${params.ENV}.tfvars"
                    }
                }
            }
        }
    }
}
