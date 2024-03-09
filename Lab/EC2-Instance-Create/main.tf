provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "dev-instance" {
  ami           = "ami-0ba259e664698cbfc"  # Replace with your desired AMI ID
  instance_type = "t2.micro"                # Replace with your desired instance type

  tags = {
    Name = "devinstance"
  }
}
