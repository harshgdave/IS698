resource "aws_vpc" "lesson6_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "lesson6-vpc"
    Purpose = "Cloud Lab Lesson 6"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.lesson6_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "lesson6-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.lesson6_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "lesson6-private-subnet"
  }
}

output "vpc_id" {
  value = aws_vpc.lesson6_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
