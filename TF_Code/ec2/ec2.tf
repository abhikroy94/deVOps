provider "aws" {
  region = "ap-south-1"
}

data "aws_security_group" "first_sg" {
  id = "sg-0f1df824896ff8f45"
}
resource "aws_instance" "ec2_first" {
    instance_type = "t2.micro"
    ami = "ami-05c179eced2eb9b5b"
    vpc_security_group_ids = [ data.aws_security_group.first_sg.id ]
    tags = {
      name = "sg_ec2"
    }
}