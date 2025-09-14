output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "ecr_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.app_repo.repository_url
}
