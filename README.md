# Swayatt Logo Server - DevOps Pipeline

A Node.js application that serves the Swayatt company logo, deployed using a complete CI/CD pipeline with Jenkins, Docker, and Kubernetes.

![Architecture](docs/architecture.png)

## What does this do?

Simple Express.js server that displays our company logo when you visit it. Built this as part of a DevOps assignment to demonstrate CI/CD best practices.

## The Pipeline

```
GitHub → Jenkins → AWS ECR → ArgoCD → Kubernetes
```

When I push code to GitHub, Jenkins automatically:
1. Builds a Docker image
2. Pushes it to AWS ECR
3. Updates the Helm chart
4. ArgoCD deploys to Kubernetes

## Tech Stack

- **App**: Node.js + Express (keeps it simple)
- **CI/CD**: Jenkins with custom shared libraries
- **Containers**: Docker + AWS ECR
- **Deployment**: Kubernetes + Helm + ArgoCD
- **Infrastructure**: Can be created with Terraform (see below)

## Running Locally

```bash
npm install
npm start
# Visit http://localhost:3000
```

## Infrastructure Options

### Current Setup
Using existing Jenkins and K8s cluster (free for development)

### Production with AWS EKS
If you want to deploy this properly on AWS, I've created Terraform scripts that set up everything:

- Jenkins server on EC2 (with Docker, kubectl, etc.)
- EKS cluster with worker nodes  
- ECR repository for images
- All the IAM roles and networking

**Cost**: Around $200-250/month for the full setup

Check out the [Terraform repo](https://github.com/NipurJain4/DevOps-Task-Swayatt-terraform.git) - just run `terraform apply` and you're good to go.

## How to Deploy

### Jenkins Setup
1. Install these plugins: Pipeline, GitHub Integration, Docker Pipeline
2. Add the shared library from [here](https://github.com/NipurJain4/Jenkins_shared_liberary.git)
3. Create a new pipeline job pointing to this repo

### ArgoCD Setup
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: swayatt-logo-server
spec:
  source:
    repoURL: https://github.com/NipurJain4/DevOps-Task-Swayatt-helm_chart.git
    path: .
  destination:
    server: https://kubernetes.default.svc
    namespace: default
```

## Project Structure

```
├── app.js              # The main server file
├── package.json        # Node.js dependencies
├── Dockerfile          # How to containerize the app
├── Jenkinsfile         # CI/CD pipeline definition
├── docs/               # Architecture diagram
├── deployment-proof/   # Screenshots of working deployment
└── WRITEUP.md         # Technical details and challenges
```

## Related Repos

- **Infrastructure**: [Terraform scripts](https://github.com/NipurJain4/DevOps-Task-Swayatt-terraform.git) for AWS setup
- **Jenkins Functions**: [Shared library](https://github.com/NipurJain4/Jenkins_shared_liberary.git) with reusable pipeline code  
- **Kubernetes Deployment**: [Helm chart](https://github.com/NipurJain4/DevOps-Task-Swayatt-helm_chart.git) for K8s deployment

## Monitoring

- Jenkins shows build status and logs
- ArgoCD shows deployment health
- Check pod logs: `kubectl logs -f deployment/swayatt-logo-server`

## What I Learned

This project helped me understand:
- How to structure a proper CI/CD pipeline
- Jenkins shared libraries for code reuse
- GitOps with ArgoCD
- Infrastructure as Code with Terraform
- Container orchestration with Kubernetes

The trickiest part was getting the Jenkins shared library to work properly with ECR authentication, but once that was sorted, everything flows smoothly.

---

Built for the Swayatt DevOps assignment. The goal was to show end-to-end automation from code commit to production deployment.
