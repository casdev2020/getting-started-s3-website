terraform {
  cloud {
    organization = "Opencast-Software"

    workspaces {
      name = "getting-started-s3-website"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
