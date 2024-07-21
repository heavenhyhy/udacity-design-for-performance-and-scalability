# AWS credentials will be obtained from the credential file in the .aws folder
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacity_t2" {
  count = 4
  ami           = "ami-06c68f701d8090592" // al2023-ami-2023.5.20240701.0-kernel-6.1-x86_64
  instance_type = "t2.micro"
  
  tags = {
    Name = "Udacity T2"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "udacity_m4" {
  count = 0
  ami           = "ami-06c68f701d8090592" // al2023-ami-2023.5.20240701.0-kernel-6.1-x86_64
  instance_type = "m4.large"
  
  tags = {
    Name = "Udacity M4"
  }
}