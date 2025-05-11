provider "aws" {
  region = "ap-south-1"
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic "
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "${var.public_ip}/32" # String interpolation #
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

output "sg_ip" {
  value = aws_vpc_security_group_ingress_rule.allow_tls_ipv4.cidr_ipv4
}