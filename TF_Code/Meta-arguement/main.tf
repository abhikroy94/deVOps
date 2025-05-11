data "aws_ami" "my_ami" {
  most_recent = "true"
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-kernel-5.10-hvm-2.0.20250414.0-x86_64-gp2" ]
  }
}

resource "aws_instance" "example" {
  count         = 2  # Creates 3 instances
  ami           = data.aws_ami.my_ami.image_id
  instance_type = "t2.micro"

  tags = {
    Name = "EC2 Instance ${count.index}"  # Each instance gets a unique name
  }
}
