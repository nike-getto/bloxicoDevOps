terraform {
  backend "s3" {
    bucket         = "bloxicosava-week6"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform_lock"
  }
}
