terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "chocojohns-25-prod"
    key    = "chocojohns-prod"
    region = "us-east-1"
    dynamodb_table = "chocojohns-25-prod"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

