provider "aws" {
  region = "your-preferred-region"
}

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "example_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "your-preferred-availability-zone"

  tags = {
    Name = "example-subnet"
  }
}

resource "aws_security_group" "example_security_group" {
  name        = "example-security-group"
  description = "Allow SSH and HTTP traffic"

  vpc_id = aws_vpc.example_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t2.micro"
  key_name      = "your-key-pair-name"
  subnet_id     = aws_subnet.example_subnet.id
  security_group_ids = [aws_security_group.example_security_group.id]

  tags = {
    Name = "example-instance"
  }
}
