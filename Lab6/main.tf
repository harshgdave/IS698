##########################################
# Lesson 6 Lab - EC2 Instance Deployment #
##########################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0018b373aba829819"  # Amazon Linux 2023 (x86_64) in us-east-1
  instance_type = "t3.micro"               # Free-tier eligible
  key_name      = "public"                 # Replace with your key pair name

  tags = {
    Name    = "lesson6-ec2"
    Purpose = "Cloud Lab Lesson 6"
  }
}

output "instance_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "instance_id" {
  value = aws_instance.my_ec2.id
}
