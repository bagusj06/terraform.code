resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnet_ip_1
  availability_zone = var.availability_zone_1
  
  tags = {
    Name = "${var.project_name}-public-subnet-${var.availability_zone_1}"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnet_ip_2
  availability_zone = var.availability_zone_2
  
  tags = {
    Name = "${var.project_name}-public-subnet-${var.availability_zone_2}"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_ip_1
  availability_zone = var.availability_zone_1

  tags = {
    Name = "${var.project_name}-private-subnet-${var.availability_zone_1}"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_ip_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = "${var.project_name}-private-subnet-${var.availability_zone_2}"
  }
}