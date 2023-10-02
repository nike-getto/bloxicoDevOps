provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "bloxico_sava"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "bloxico_sava_db"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
}
