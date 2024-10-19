provider "aws" {
  region = local.aws_region

  # prevents you from trying to run this tf with credentials meant for the WRONG account
  allowed_account_ids = ["your_aws_account_id"]
}

terraform {
  required_providers {
    aws = {
      version
      hashicorp source
    }
  }
}