
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "devops_demo" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "aws-devops-demo"
    Environment = "learning"
    ManagedBy   = "Terraform"
  }
}
