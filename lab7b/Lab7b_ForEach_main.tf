terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

variable "instances" {
  type = map(string)
  default = {
    web1 = "t3.micro"
    web2 = "t3.micro"
    web3 = "t3.small"
  }
}

resource "aws_instance" "web" {
  for_each      = var.instances
  ami           = data.aws_ami.al2023.id
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
