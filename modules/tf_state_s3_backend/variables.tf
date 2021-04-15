variable "devops_group_name" {
  description = "The AlmaLinux DevOps group name"
  type        = string
}

variable "dynamodb_table" {
  description = "The DynamoDB table name to store the Terraform state"
  type        = string
}

variable "bucket" {
  description = "The name of the bucket"
  type        = string
}

variable "tags" {
  description = "Tags to set on the bucket"
  type        = map(string)
  default     = {}
}

variable "key" {
  description = "The bucket key for the Terraform state"
  type        = string
}

variable "kms_key_id" {
  description = "The KMS key identifier for the bucket encryption"
  type        = string
}
