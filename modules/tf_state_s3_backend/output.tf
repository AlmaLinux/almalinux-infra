output "arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.tf_state_bucket.arn
}

output "id" {
  description = "The ID (name) of the bucket"
  value       = aws_s3_bucket.tf_state_bucket.id
}

output "region" {
  description = "The AWS region of the bucket"
  value       = aws_s3_bucket.tf_state_bucket.region
}
