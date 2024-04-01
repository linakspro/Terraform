terraform{
  backend "s3" {
    bucket = "terraform-test-bucket-01234"
    key = "key/terraform.tfstate"
    region = "ap-south-1"
  }

}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAZI2LIDWV3ZXVW5FW"
  secret_key = "aqJHD1mAhi3VgNPq9CYZMQfHZXQAvqEn4Boaf+R5"
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-0e159fc62d940d348"
  instance_type = "t2.micro"
  count = 1

  tags = {
    Name = "Terraform EC2"
  }
}
