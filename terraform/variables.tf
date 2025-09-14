variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "swayatt-eks-cluster"
}

variable "ecr_repo_name" {
  description = "ECR repository name"
  type        = string
  default     = "sawattaya"
}
