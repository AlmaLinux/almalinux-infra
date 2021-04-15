/**
 * Creates S3 bucket and a DynamoDB database for storing a Terraform state.
 */


data "aws_iam_group" "devops_group" {
  group_name = var.devops_group_name
}

data "aws_kms_key" "kms_key" {
  key_id = var.kms_key_id
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = var.bucket
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = data.aws_kms_key.kms_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  tags   = var.tags
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_policy" "tf_state_bucket_policy" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "${aws_s3_bucket.tf_state_bucket.id}-policy"
    Statement = [
      {
        Effect = "Allow"
        Action = "s3:ListBucket"
        Principal = {
          AWS = data.aws_iam_group.devops_group.users[*].arn
        }
        Resource = aws_s3_bucket.tf_state_bucket.arn
      },
      {
        Effect = "Allow"
        Action = ["s3:GetObject", "s3:PutObject"]
        Principal = {
          AWS = data.aws_iam_group.devops_group.users[*].arn
        }
        Resource = "${aws_s3_bucket.tf_state_bucket.arn}/${var.key}"
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "tf_state_bucket" {
  bucket                  = aws_s3_bucket.tf_state_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "tf_state_locks" {
    name           = var.dynamodb_table
    read_capacity  = 5
    write_capacity = 5
    server_side_encryption {
      enabled = true
      kms_key_arn = data.aws_kms_key.kms_key.arn
    }
    tags = var.tags
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
}
