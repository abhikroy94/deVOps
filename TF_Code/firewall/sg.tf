provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "first_sg" {
    name = "first_sg_tls"
    description = "nice one "
}

resource "aws_vpc_security_group_ingress_rule" "first_inbound" {
    security_group_id = aws_security_group.first_sg.id
    cidr_ipv4         = "0.0.0.0/0"
    from_port         = 22
    ip_protocol       = "tcp"
    to_port           = 22
}

