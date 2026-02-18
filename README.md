# Task-7: Strapi Deployment on AWS ECS using Terraform & GitHub Actions


## Project Overview
This project demonstrates deploying a **Strapi application** on **AWS ECS Fargate** using **Infrastructure as Code (Terraform)** and **CI/CD automation with GitHub Actions**.

The goal of Task-7 was to:
- Containerize a Strapi application
- Automate image build and push using GitHub Actions
- Provision AWS infrastructure using Terraform
- Deploy the application on ECS

---

## Architecture Overview
```text
GitHub Push
   ↓
GitHub Actions (CI/CD)
   ↓
Docker Image Build
   ↓
Docker Hub
   ↓
Terraform Apply
   ↓
AWS ECS Cluster
   ↓
ECS Task Definition & Service
```

---

## Technologies Used
- Strapi (Node.js Headless CMS)
- Docker
- GitHub Actions (CI/CD)
- Terraform (Infrastructure as Code)
- AWS ECS Fargate
- AWS Default VPC & Subnets

---

## Repository Structure
```text
.
├── strapi/ # Strapi application source
│ ├── Dockerfile
│ ├── package.json
│ └── config/
│
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ ├── providers.tf
│ └── modules/
│ ├── ecs/
│ └── rds/
│
└── .github/
└── workflows/
├── ci.yml
└── deploy.yml
```

---

## CI/CD Workflow (GitHub Actions)
The GitHub Actions pipeline performs the following steps:
- Checkout source code
- Build Docker image for Strapi
- Tag image using commit SHA
- Push image to Docker Hub
- Run Terraform to provision/update AWS infrastructure
- Deploy ECS cluster, task definition, and service

All infrastructure provisioning and deployment is automated using GitHub Actions.

---

## Infrastructure Provisioned via Terraform
- ECS Cluster
- ECS Cluster
- ECS Task Definition
- ECS Service (Fargate)
- Networking using default VPC and subnets
- Modular Terraform structure for maintainability

---

## Achievements
- Successfully containerized Strapi application
- Automated Docker image build and push using CI
- Implemented CI/CD-driven infrastructure provisioning
- Deployed application on AWS ECS Fargate using Terraform
- Applied real-world Terraform modular design

---

## Limitations / Constraints
- Deployment was performed in a **shared AWS account** with limited IAM permissions
- Existing AWS resources caused idempotency conflicts during Terraform runs
- These were handled by reusing existing resources via Terraform data sources
- Application accessibility was not the primary requirement of Task-7

---

## Conclusion
This project successfully demonstrates:
- Infrastructure as Code using Terraform
- CI/CD automation with GitHub Actions
- Containerized Strapi deployment on AWS ECS Fargate
- Handling real-world constraints such as shared cloud environments

---

## Author
**Jaspal Gundla**



