terraform {
  backend "s3" {
    s3 bucket for state
    kms key for encryption
    region 
    dynamo db table for state locking
  }
}