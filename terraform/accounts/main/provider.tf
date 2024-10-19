provider "aws" {
  region = local.aws_region
  account_id = "your_aws_account_id" # prevents you from trying to run this tf with credentials meant for the WRONG account
}