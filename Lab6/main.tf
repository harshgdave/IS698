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
  ami           = "ami-0018b373aba829819"  
  instance_type = "t3.micro"               
  key_name      = "public"                 

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
