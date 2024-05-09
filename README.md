# Terraform Infrastructure Deployment for AWS using Jenkins Pipeline

This project automates the deployment of networking and compute resources on Amazon Web Services (AWS) using Terraform. It offers a modular and scalable approach to provision infrastructure across different environments like development and production.

## Table of Contents 📌
- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Variables](#variables)
- [Modules](#modules)
- [Remote State and Locking](#remote-state-and-locking)
- [Email Notification](#email-notification)
- [Monitoring](#monitoring)
- [Jenkins Pipeline Integration](#jenkins-pipeline-integration)

## Introduction ⬇️
Leveraging Terraform, this project facilitates the automation of networking and compute resource provisioning on AWS. It adheres to best practices such as infrastructure-as-code (IaC) and modularization, ensuring consistency, scalability, and reliability of infrastructure.

## Features ✔️
- **Networking**: Configures VPC, Internet Gateway, NAT Gateway, subnets,app load balancer and route tables.
- **Compute**: Deploys EC2 instances with predefined security groups.
- **Workspaces**: Manages separate Terraform workspaces for different deployment environments.
- **Variables**: Utilizes variable files for environment-specific configurations.
- **Modules**: Uses modular architecture for manageable and reusable infrastructure code.
- **Remote State and Locking**: Implements remote state storage with locking to prevent concurrent state modifications.
- **Email Notification**: Integrates with AWS SES for sending notifications about infrastructure changes.
- **RDS and ElastiCache**: Supports deployment of RDS and ElastiCache services.
- **GitHub Integration**: Manages infrastructure code using GitHub for version control.
- **Lambda Functions**: Deploys AWS Lambda functions to run serverless applications directly linked to AWS resources.

## Prerequisites 
- AWS account with necessary permissions.
- Terraform installed on your local machine.
- AWS CLI configured with user access keys.
- A verified email address for AWS SES notifications.
- Jenkins server with necessary plugins installed for running Terraform pipelines.

## Usage 
1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Update `dev.tfvars` and `prod.tfvars` with your specific configurations.
4. Initialize the project with `terraform init`.
5. Preview the deployment plan with `terraform plan -var-file=env.tfvars`.
6. Apply the configuration with `terraform apply -var-file=env.tfvars`.
7. Confirm the deployment in the AWS Management Console.

## Variables
Edit the `.tfvars` files to match your specific environment needs, guided by the comments within these files.

## Modules
Utilize pre-defined modules in the `modules/` directory for better organization and reusability of the infrastructure code.

## Remote State and Locking
Configure the `backend.tf` to use an AWS S3 bucket for remote state management and enable state locking with DynamoDB to prevent concurrent modifications.

## Email Notification
Set up AWS SES for email notifications by verifying your email.

## Monitoring
Implement monitoring through AWS CloudWatch and set up alerts to monitor resource utilization and system performance. Additionally, deploy AWS Lambda functions for automated response to specific alerts or conditions, enhancing operational resilience and proactive management of the infrastructure.

## Jenkins Pipeline Integration
This project is integrated with a Jenkins CI/CD pipeline to automate the deployment process. The pipeline handles:
- Fetching the latest code from the repository.
- Running `terraform plan` to show changes.
- Applying `terraform apply` to update the AWS infrastructure according to the latest configurations.
- Managing environment-specific configurations through Jenkins environment variables or parameterized builds.
