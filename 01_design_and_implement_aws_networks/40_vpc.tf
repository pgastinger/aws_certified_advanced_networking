data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2-app-server" {
  ami                    = data.aws_ami.app_ami.id
  instance_type          = "t2.micro"
  count                  = 2
  subnet_id              = element([aws_subnet.lab01_subnet_03.id, aws_subnet.lab01_subnet_04.id], count.index)
  vpc_security_group_ids = [aws_security_group.SG-2.id]
  tags = {
    Name = "ec2-app-server-instance-${count.index + 1}"
  }
}
