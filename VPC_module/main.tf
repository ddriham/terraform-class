resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_dns_support      = true
  enable_dns_hostnames    = true
  tags = {
    Name      = "main-ddriham"
    ManagedBy = "terraform"
  }
}

resource "aws_subnet" "main-public-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_blocks[0]
  map_public_ip_on_launch = true
  availability_zone       = "${var.AWS_REGION}a"
}

resource "aws_subnet" "main-public-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_blocks[1]
  map_public_ip_on_launch = true
  availability_zone       = "${var.AWS_REGION}b"
}

resource "aws_subnet" "main-public-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_blocks[2]
  map_public_ip_on_launch = true
  availability_zone       = "${var.AWS_REGION}c"
}

resource "aws_subnet" "main-private-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr_blocks[0]
  map_public_ip_on_launch = false
  availability_zone       = "${var.AWS_REGION}a"
}

resource "aws_subnet" "main-private-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr_blocks[1]
  map_public_ip_on_launch = false
  availability_zone       = "${var.AWS_REGION}b"
}

resource "aws_subnet" "main-private-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr_blocks[2]
  map_public_ip_on_launch = false
  availability_zone       = "${var.AWS_REGION}c"
}

resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name      = "main"
    ManagedBy = "terraform"
  }
}

resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
  tags = {
    Name      = "main-public-1"
    ManagedBy = "terraform"
  }
}

resource "aws_route_table_association" "main-public-1a" {
  subnet_id        = aws_subnet.main-public-1.id
  route_table_id   = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-2a" {
  subnet_id        = aws_subnet.main-public-2.id
  route_table_id   = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-3a" {
  subnet_id        = aws_subnet.main-public-3.id
  route_table_id   = aws_route_table.main-public.id
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.main-public-1.id
  depends_on    = [aws_internet_gateway.main-gw]
}

resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name      = "main-private-1"
    ManagedBy = "terraform"
  }
}

resource "aws_route_table_association" "main-private-1a" {
  subnet_id        = aws_subnet.main-private-1.id
  route_table_id   = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-2a" {
  subnet_id        = aws_subnet.main-private-2.id
  route_table_id   = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-3a" {
  subnet_id        = aws_subnet.main-private-3.id
  route_table_id   = aws_route_table.main-private.id
}