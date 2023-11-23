terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.26.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">=2.4.0"
    }
  }
  backend "s3" {
    bucket = "joao-dev-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}