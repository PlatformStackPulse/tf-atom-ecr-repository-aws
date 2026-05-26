output "enabled" {
  description = "Whether the module is enabled"
  value       = local.enabled
}

output "arn" {
  description = "ARN of the ECR repository"
  value       = try(aws_ecr_repository.this[0].arn, null)
}

output "repository_url" {
  description = "URL of the ECR repository"
  value       = try(aws_ecr_repository.this[0].repository_url, null)
}

output "registry_id" {
  description = "Registry ID of the ECR repository"
  value       = try(aws_ecr_repository.this[0].registry_id, null)
}
