terraform {
  backend "s3" {
    bucket = "ddriham-terraform-state"
    key = "eu-west-1/state/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "ddriham-lock"

  }
}

provider "aws" {
    region = "eu-west-1"
}