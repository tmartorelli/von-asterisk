provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.24"
}

terraform {
  required_version = "= 0.12.10"
  backend "s3" {
    bucket = "vonage-ip-pbx-terraform-state-files"
    key    = "ip-pbx/terraform.tfstate"
    region = "eu-west-1"

    dynamodb_table = "terraform-state-lock-table"
  }
}