terraform {
    backend "s3" {
        bucket = "bloxico_sava"
        key = "terraform.tfstate"
        region = "eu-central-1"
        dynamodb_table = "bloxico_sava_db"
    }
}