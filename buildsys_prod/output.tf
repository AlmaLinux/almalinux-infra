output "tf_state_bucket_id" {
  description = "The ID (name) of the Terraform state bucket"
  value       = module.tf_state_s3_backend.id
}

output "tf_state_bucket_arn" {
  description = "The ARN of the Terraform state bucket"
  value       = module.tf_state_s3_backend.arn
}

output "arm64-builder01_ip" {
  description = "arm64-builder01.almalinux.org build node IP address"
  value       = metal_device.arm64-builder01.network.0.address
}

output "arm64-builder02_ip" {
  description = "arm64-builder02.almalinux.org build node IP address"
  value       = metal_device.arm64-builder02.network.0.address
}

output "arm64-builder03_ip" {
  description = "arm64-builder03.almalinux.org build node IP address"
  value       = metal_device.arm64-builder03.network.0.address
}
