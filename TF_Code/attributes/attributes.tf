provider "aws" {
  region = "ap-south-1"
}

resource "aws_eip" "first_eip" {
  domain   = "vpc"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic "
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "${aws_eip.first_eip.public_ip}/32" # String interpolation #
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_instance" "abhik" {
  ami = "ami-05c179eced2eb9b5b"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
}