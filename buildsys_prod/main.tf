terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.36.0"
    }
    metal = {
      source  = "equinix/metal"
      version = ">=2.0.0"
    }
  }
}

terraform {
  backend "s3" {}
}

provider "aws" {}

data "aws_secretsmanager_secret_version" "tf_secrets" {
  secret_id = "almalinux-prod-devops-tfvars"
}

locals {
  tf_secrets = jsondecode(data.aws_secretsmanager_secret_version.tf_secrets.secret_string)
}


module "tf_state_s3_backend" {
  source = "../modules/tf_state_s3_backend"
  bucket = local.tf_secrets["tf_state_bucket"]
  dynamodb_table = local.tf_secrets["tf_state_dynamodb_table"]
  key = local.tf_secrets["tf_state_key"]
  kms_key_id = local.tf_secrets["tf_state_kms_key_id"]
  tags = {
    terraform = true
    environment = "production"
  }
  devops_group_name = local.tf_secrets["tf_state_devops_group_name"]
}
