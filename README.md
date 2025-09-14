# DevOps CI/CD Pipeline - Swayatt Logo Server

A complete CI/CD pipeline implementation for a Node.js application using Jenkins, Docker, AWS ECR, ArgoCD, and Kubernetes.

## 🏗️ Architecture

![Architecture Diagram](docs/architecture.png)

```
GitHub → Jenkins → AWS ECR → ArgoCD → Kubernetes
   ↓        ↓         ↓        ↓         ↓
Webhook  Build/Push  Push   GitOps   Deploy
```

## ☁️ Infrastructure Options

### Current Setup (Cost-Effective)
- **Existing Infrastructure**: Uses pre-configured Jenkins server and Kubernetes cluster
- **Monthly Cost**: ~$0 (using existing resources)

### Production Setup with Terraform (Recommended)
For a complete production environment, use our Terraform infrastructure:

**🏗️ Infrastructure Components:**
- **Jenkins Master**: EC2 t3.medium instance with pre-installed tools
- **EKS Cluster**: Managed Kubernetes with 2 worker nodes
- **ECR Repository**: Private container registry
- **VPC & Networking**: Custom VPC with public/private subnets
- **IAM Roles**: Proper permissions for Jenkins-EKS integration

**💰 Cost Breakdown:**
- EKS Cluster: ~$73/month
- EC2 Jenkins (t3.medium): ~$30/month  
- Worker Nodes (t3.medium x2): ~$60/month
- NAT Gateway: ~$45/month
- ECR Storage: ~$5/month
- **Total Estimated Cost**: ~$213/month

**🚀 Quick Deploy:**
```bash
git clone https://github.com/NipurJain4/DevOps-Task-Swayatt-terraform.git
cd DevOps-Task-Swayatt-terraform
terraform init && terraform apply
```

This will create a complete production-ready DevOps infrastructure in AWS.

## 🛠️ Tech Stack

- **Application**: Node.js + Express
- **CI/CD**: Jenkins with shared libraries
- **Containerization**: Docker
- **Registry**: AWS ECR
- **Orchestration**: Kubernetes
- **Package Management**: Helm
- **GitOps**: ArgoCD
- **Version Control**: GitHub

## 🚀 Pipeline Stages

1. **Build**: Create Docker image
2. **Tag**: Tag image for ECR
3. **Push**: Upload to AWS ECR
4. **Deploy**: Update Helm chart, ArgoCD auto-syncs

## 📋 Setup Instructions

### Prerequisites
- Jenkins server with Docker and AWS CLI
- Kubernetes cluster with ArgoCD
- AWS ECR repository
- GitHub repository with webhook

**💡 For EKS Setup:** Use our [Terraform repository](https://github.com/NipurJain4/DevOps-Task-Swayatt-terraform.git) to create complete AWS infrastructure including Jenkins EC2, EKS cluster, and ECR repository.

### 1. Jenkins Configuration
```bash
# Required plugins: Pipeline, GitHub Integration, Docker Pipeline, AWS Steps
# Configure shared library:
# Manage Jenkins → Configure System → Global Pipeline Libraries
# Name: sharedlib
# Repository: https://github.com/NipurJain4/Jenkins_shared_liberary.git
```

### 2. Manual Build Trigger
- Builds are triggered manually from Jenkins UI
- Navigate to Jenkins → Your Job → "Build Now"

### 3. ArgoCD Application
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: swayatt-logo-server
spec:
  source:
    repoURL: https://github.com/NipurJain4/DevOps-Task-Swayatt-helm_chart.git
    path: .
    targetRevision: main
  destination:
    server: https://kubernetes.default.svc
    namespace: default
```

## 🧪 Running the Application

```bash
# Install dependencies
npm install

# Run application
npm start
# Access at http://localhost:3000
```

## 📁 Repository Structure

```
├── app.js              # Main application
├── package.json        # Dependencies and scripts
├── Dockerfile          # Container definition
├── Jenkinsfile         # CI/CD pipeline
├── docs/               # Documentation and diagrams
├── deployment-proof/   # Deployment screenshots
└── WRITEUP.md         # Technical implementation details
```

## 🔗 Related Repositories

- **🏗️ Infrastructure (Terraform)**: [DevOps-Task-Swayatt-terraform](https://github.com/NipurJain4/DevOps-Task-Swayatt-terraform.git)
  - Complete AWS infrastructure setup (EKS + ECR + Jenkins EC2)
  - One-command deployment with Terraform
  - Production-ready with proper IAM roles and networking
- **📚 Shared Library**: [Jenkins_shared_liberary](https://github.com/NipurJain4/Jenkins_shared_liberary.git)
- **📦 Helm Chart**: [DevOps-Task-Swayatt-helm_chart](https://github.com/NipurJain4/DevOps-Task-Swayatt-helm_chart.git)

## 📊 Monitoring

- Jenkins build logs and status
- ArgoCD application health and sync status  
- Kubernetes pod logs: `kubectl logs -f deployment/swayatt-logo-server`
- AWS ECR repository for image versions

## What is this app?

This is a lightweight Node.js application built with Express.js that serves a single logo image (`logoswayatt.png`) when accessed through a web browser. When you visit the root URL, the server responds by displaying the Swayatt logo.
