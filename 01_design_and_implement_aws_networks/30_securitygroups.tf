resource "aws_security_group" "SG-1" {
  name        = "SG-1"
  description = "SG-1 public"
  vpc_id      = aws_vpc.lab01_vpc.id

  ingress {
    description = "HTTP from World"
    from_port   =80 
    to_port     = 80 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-1 public"
  }
}

resource "aws_security_group" "SG-2" {
  name        = "SG-2"
  description = "SG-2 private"
  vpc_id      = aws_vpc.lab01_vpc.id

  ingress {
    description = "HTTP from SG-1"
    from_port   =80 
    to_port     = 80 
    protocol    = "tcp"
    security_groups = [aws_security_group.SG-1.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-2 private"
  }
}
