🚀 Strapi Deployment Automation using GitHub Actions & Terraform

This project demonstrates a complete CI/CD pipeline to automate the deployment of a Strapi application on AWS EC2 using Docker, GitHub Actions, and Terraform.

The goal is to eliminate manual deployment steps and follow real-world DevOps best practices.

📌 Project Overview

CI (Continuous Integration)
Builds and pushes a Docker image of the Strapi application to Docker Hub.

CD (Continuous Deployment)
Uses Terraform to provision AWS infrastructure and deploy the Dockerized Strapi app on EC2.

🧱 Tech Stack Used

Strapi – Headless CMS

Docker – Application containerization

GitHub Actions – CI/CD automation

Terraform – Infrastructure as Code (IaC)

AWS EC2 – Cloud compute

Docker Hub – Image registry

📂 Project Structure
Strapi-automate-deployment/
├── my-strapi/
│   ├── Dockerfile
│   ├── package.json
│   ├── src/
│   └── terraform/
│       ├── main.tf
│       ├── variables.tf
│       ├── provider.tf
│       └── outputs.tf
└── .github/
    └── workflows/
        ├── ci.yml
        └── terraform.yml

🔄 CI/CD Workflow Explanation
✅ CI – Build & Push Docker Image

Triggered on push to main branch

Builds Docker image using Strapi Dockerfile

Pushes image to Docker Hub as latest

✅ CD – Deploy to AWS EC2

Triggered manually using workflow_dispatch

Terraform:

Creates security group (SSH + port 1337)

Launches EC2 instance

Installs Docker using user_data

Pulls Docker image

Runs Strapi container automatically

🔐 GitHub Secrets Configuration

Create the following secrets in:

GitHub Repository → Settings → Secrets → Actions

Required Secrets
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION

Example
AWS_REGION = ap-south-1


⚠️ Do NOT upload SSH .pem files to GitHub secrets.

🔑 SSH Key Clarification

Terraform uses only the EC2 key pair name

GitHub Actions does not use SSH

The .pem file is used only locally for manual debugging

key_name = "strapi-key"

🚀 How to Run the Project
Step 1: Push Code
git push origin main


→ CI pipeline runs automatically

Step 2: Deploy Infrastructure

Go to GitHub → Actions

Select CD – Deploy to EC2

Click Run workflow

Step 3: Access Application

After deployment completes, open:

http://<EC2_PUBLIC_IP>:1337

📤 Terraform Outputs

Terraform provides useful outputs:

EC2 Public IP

Strapi Application URL

Example:

http://<EC2_PUBLIC_IP>:1337

🧠 DevOps Best Practices Followed

Infrastructure as Code (Terraform)

Secure secret management

No private keys in CI/CD

Dockerized deployments

Reproducible infrastructure

Clear CI/CD separation

📈 Future Improvements

Versioned Docker image tags

Terraform remote backend (S3 + DynamoDB)

Health checks in pipeline

Nginx reverse proxy

HTTPS with domain name

👤 Author

Piyush Rajawat
DevOps Enthusiast | AWS | Docker | Terraform | GitHub Actions

loom link = https://www.loom.com/share/0dc834ed8bf0451c8f2a94616655cf75

