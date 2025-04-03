# OnFinance AI Infrastructure

This repository contains Terraform code for deploying the OnFinance AI infrastructure on AWS. The infrastructure is designed to be highly available, secure, and scalable.

## Architecture Overview

- **Networking**: Multi-AZ VPC with public and private subnets
- **Compute**: EKS cluster in private app subnets
- **Database**: RDS MySQL and ElastiCache Redis in private data subnets
- **Load Balancing**: Application Load Balancer with HTTPS support
- **Security**: WAF, Shield, and security groups
- **Monitoring**: CloudWatch, CloudTrail, and X-Ray

## Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform v1.0.0 or newer
- kubectl (for interacting with the EKS cluster)

## Directory Structure

terraform-project/
├── main.tf            # Main Terraform file
├── variables.tf       # Input variables
├── locals.tf          # Local values
├── outputs.tf         # Output values
├── modules/           # Terraform modules
│   ├── vpc/           # VPC and networking
│   ├── security/      # Security groups and WAF
│   ├── database/      # RDS and ElastiCache
│   ├── eks/           # EKS cluster
│   ├── monitoring/    # Logging and monitoring
│   └── load_balancer/ # ALB configuration


## Deployment Instructions

1. Initialize Terraform:
terraform init
Copy
2. Create a `terraform.tfvars` file with your specific values:
aws_region = "us-west-2"
project_name = "onfinance-ai"
environment = "dev"
vpc_cidr = "10.0.0.0/16"
db_password = "your-secure-password"
domain_name = "app.onfinance-ai.example.com"
Copy
3. Review the execution plan:
terraform plan
Copy
4. Apply the configuration:
terraform apply
Copy
5. Configure kubectl to access the EKS cluster:
aws eks update-kubeconfig --name onfinance-ai-dev-cluster --region us-west-2
Copy
## Clean Up

To tear down the infrastructure:
terraform destroy
Copy
## High Availability and Security Features

- **High Availability**:
  - Resources deployed across multiple availability zones
  - Auto-scaling EKS node groups
  - Multi-AZ RDS database
  - ElastiCache Redis with failover capability

- **Security**:
  - Network segmentation with public/private subnets
  - Security groups for traffic control
  - WAF for web application protection
  - Shield for DDoS protection
  - Encryption for sensitive data
  - HTTPS for secure communication
Putting it all together:

Create a directory structure exactly as shown above
Create all the files with the content provided
Create a terraform.tfvars file with your specific values
Initialize and apply the Terraform configuration

For your first deployment, follow these steps:

Install Terraform if you haven't already
Create the directory structure and files
Run terraform init to initialize the project
Run terraform validate to check for syntax errors
Run terraform plan to see what will be created
Run terraform apply to create the infrastructure

Remember to set sensitive values like database passwords using environment variables or secure methods rather than hardcoding them in your files.
As a beginner, take your time to understand each component of the code. The structure follows Terraform best practices with modular organization, which makes it easier to maintain and expand in the future.