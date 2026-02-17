# Task-7: Strapi Deployment on AWS ECS using Terraform & GitHub Actions


## Project Overview
This project demonstrates deploying a Strapi application on AWS ECS using Infrastructure as Code (Terraform) and CI/CD automation with GitHub Actions.

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
Container Registry (ECR / Docker Hub)
   ↓
Terraform Apply
   ↓
AWS ECS Cluster
   ↓
ECS Task Definition
```

---

## Technologies Used
- Strapi (Node.js Headless CMS)
- Docker
- GitHub Actions (CI/CD)
- Terraform (Infrastructure as Code)
- AWS ECS
- AWS EC2 / Fargate
- AWS VPC & Security Groups

---

## Repository Structure
```text
.
├── strapi/                    # Strapi application source
│   ├── Dockerfile
│   ├── package.json
│   └── config/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── modules/
│       ├── ecs/
│       ├── vpc/
│       └── rds/
│
└── .github/
    └── workflows/
        └── deploy.yml
```

---

## CI/CD Workflow (GitHub Actions)
The GitHub Actions pipeline performs the following steps:
1. Checkout repository code
2. Build Docker image for Strapi
3. Push the image to a container registry
4. Run Terraform to provision/update AWS infrastructure
5. Create ECS cluster and task definition

The workflow ensures infrastructure and application deployment are automated.

---

## Infrastructure Provisioned via Terraform
- ECS Cluster
- ECS Task Definition
- Networking (VPC & subnets – reused default VPC)
- Security Groups
- Supporting Terraform modules for clean structure
Terraform was used in a modular approach for clarity and maintainability.

## Achievements / What Worked Successfully

- Strapi application successfully containerized

-  Docker image build automated via GitHub Actions

- CI/CD pipeline executed infrastructure provisioning
-  Real-world ECS deployment flow implemented

---

## Limitation Encountered 
During deployment, the ECS task failed to pull the container image due to restricted IAM permissions in the provided AWS account.

### Key limitation:
- IAM roles and policies (ECR access, task execution role permissions) could not be modified
- ECS requires ecr:GetAuthorizationToken or equivalent permissions to pull images from private ECR
- Repository policies and IAM role updates were restricted

### Result:
- ECS cluster and task definitions were created
- Runtime container pull was blocked due to account-level permission restrictions

---

## Conclusion
This project successfully demonstrates:
- Infrastructure as Code with Terraform
- CI/CD automation using GitHub Actions
- Containerized Strapi deployment design for AWS ECS

---

## Author
Jaspal Gundla 