//EC2 Instance Creation
resource "aws_instance" "dev-instance1" {
  ami                    = "ami-0ba259e664698cbfc" # Replace with your desired AMI ID
  instance_type          = "t2.micro"              # Replace with your desired instance type
  key_name               = "eksuser"
  subnet_id              = aws_subnet.demo-subnet.id
  vpc_security_group_ids = [aws_security_group.demo-vpc-sg.id]

  tags = {
    Name = "dev-instance1"
  }
}