terraform {
  required_version = "~> 1.6.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.74.3"

    }
  }
}

provider "aws" {
  region = "us-east-1"
}
