provider "aws" {
  region = "ap-south-1"
}
locals {
  default = {
    name = "dynamic_sec_group"
    CreateDate = "date-${formatdate("DDMMYY",timestamp())}"
  }
}
resource "aws_security_group" "dyn_sg" {
    name = "dynamosg"
    description = "Ingress"
    tags = local.default
    
dynamic "ingress" {
  for_each = var.sg_port
  content {
    from_port = ingress.value
    to_port = ingress.value
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
  
}