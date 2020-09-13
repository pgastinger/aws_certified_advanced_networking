resource "aws_route_table" "lab01_subnet01_rt" {
  vpc_id = aws_vpc.lab01_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "RT Subnet01"
  }
}

resource "aws_route_table_association" "lab01_subnet01_rt_assoc" {
  subnet_id      = aws_subnet.lab01_subnet_01.id
  route_table_id = aws_route_table.lab01_subnet01_rt.id
}

resource "aws_route_table" "lab01_subnet02_rt" {
  vpc_id = aws_vpc.lab01_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "RT Subnet02"
  }
}
resource "aws_route_table_association" "lab01_subnet02_rt_assoc" {
  subnet_id      = aws_subnet.lab01_subnet_02.id
  route_table_id = aws_route_table.lab01_subnet02_rt.id
}

resource "aws_route_table" "lab01_subnet03_rt" {
  vpc_id = aws_vpc.lab01_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw_public_01.id
  }
  tags = {
    Name = "RT Subnet03"
  }
}

resource "aws_route_table_association" "lab01_subnet03_rt_assoc" {
  subnet_id      = aws_subnet.lab01_subnet_03.id
  route_table_id = aws_route_table.lab01_subnet03_rt.id
}

resource "aws_route_table" "lab01_subnet04_rt" {
  vpc_id = aws_vpc.lab01_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw_public_02.id
  }
  tags = {
    Name = "RT Subnet04"
  }
}

resource "aws_route_table_association" "lab01_subnet04_rt_assoc" {
  subnet_id      = aws_subnet.lab01_subnet_04.id
  route_table_id = aws_route_table.lab01_subnet04_rt.id
}
