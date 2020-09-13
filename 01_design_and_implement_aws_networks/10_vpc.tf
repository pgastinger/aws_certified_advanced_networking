resource "aws_vpc" "lab01_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "LAB01_VPC"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "lab01_subnet_01" {
  vpc_id                  = aws_vpc.lab01_vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Public 01"
  }
}

resource "aws_subnet" "lab01_subnet_02" {
  vpc_id                  = aws_vpc.lab01_vpc.id
  cidr_block              = "10.0.8.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Public 02"
  }
}

resource "aws_subnet" "lab01_subnet_03" {
  vpc_id            = aws_vpc.lab01_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Private 01"
  }
}

resource "aws_subnet" "lab01_subnet_04" {
  vpc_id            = aws_vpc.lab01_vpc.id
  cidr_block        = "10.0.9.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Private 02"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.lab01_vpc.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_eip" "nat_public_01" {
  vpc = true
}

resource "aws_eip" "nat_public_02" {
  vpc = true
}

resource "aws_nat_gateway" "gw_public_01" {
  allocation_id = aws_eip.nat_public_01.id
  subnet_id     = aws_subnet.lab01_subnet_01.id
  depends_on    = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "gw_public_02" {
  allocation_id = aws_eip.nat_public_02.id
  subnet_id     = aws_subnet.lab01_subnet_02.id
  depends_on    = [aws_internet_gateway.igw]
}
