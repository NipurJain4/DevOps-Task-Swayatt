# Terraform Infrastructure

## Prerequisites
- AWS CLI configured
- Terraform installed

## Deploy Infrastructure

```bash
# Initialize Terraform
terraform init

# Plan deployment
terraform plan

# Apply infrastructure
terraform apply

# Get cluster config
aws eks update-kubeconfig --region ap-south-1 --name swayatt-eks-cluster
```

## Resources Created
- EKS Cluster with 2 worker nodes
- VPC with public/private subnets
- ECR repository
- Security groups and IAM roles

## Cleanup
```bash
terraform destroy
```
