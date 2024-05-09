resource "aws_vpc" "vpc1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "vpc1"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "gw1"
  }
}
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}
resource "aws_route_table" "public_route2_table" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "PublicRoute2Table"
  }
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "PrivateRouteTable"
  }
   route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
}
resource "aws_route_table" "private_route2_table" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "PrivateRouteTable"
  }
   route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
}

resource "aws_subnet" "pubsubnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.pub_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a" 
  tags = {
    Name = "pubsubnet1"
  }
}
resource "aws_subnet" "pubsubnet2" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.pub_subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b" 
  tags = {
    Name = "pubsubnet2"
  }
}
resource "aws_subnet" "privsubnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.priv_subnet_cidr
  availability_zone       = "us-east-1a" 
  tags = {
    Name = "privsubnet1"
  }
}
resource "aws_subnet" "privsubnet2" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.priv_subnet2_cidr
    availability_zone       = "us-east-1a" 

  tags = {
    Name = "privsubnet2"
  }
}

resource "aws_route_table_association" "public_route" {
  subnet_id      = aws_subnet.pubsubnet1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route2" {
  subnet_id      = aws_subnet.pubsubnet2.id
  route_table_id = aws_route_table.public_route2_table.id
}
resource "aws_route_table_association" "private_route" {
  subnet_id      = aws_subnet.privsubnet1.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "private_route2" {
  subnet_id      = aws_subnet.privsubnet2.id
  route_table_id = aws_route_table.private_route2_table.id
}

resource "aws_eip" "nat_gateway_ip" {
  vpc = true
  depends_on = [
    aws_internet_gateway.gw,
  ]
}
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.nat_gateway_ip.id
  subnet_id     = aws_subnet.pubsubnet1.id  

  tags = {
    Name = "MyNATGateway"
  }

  depends_on = [
    aws_eip.nat_gateway_ip,
  ]
}

