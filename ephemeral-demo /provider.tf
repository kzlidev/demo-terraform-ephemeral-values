terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.77.0" # When ephemeral value was introduced
    }
  }
}


provider "aws" {
  region = var.region
}