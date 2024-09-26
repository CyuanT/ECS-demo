terraform {
  required_version = "~> 1.9.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
# Uncomment the region, access_key and secret_key if you are running locally
provider "aws" {
  region = "us-east-1" # Update accordingly
  #access_key = ""                     # Update accordingly
  #secret_key = ""                     # Update accordingly
}