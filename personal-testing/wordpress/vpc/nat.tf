resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
  
  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_eip" "nat_eip_1" {
  domain = "vpc"
}

resource "aws_eip" "nat_eip_2" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.nat_eip_1.id
  subnet_id     = aws_subnet.public_1.id 

  tags = {
    Name = "${var.project_name}-nat-gw-${var.availability_zone_1}"
  }
}

resource "aws_nat_gateway" "nat_2" {
  allocation_id = aws_eip.nat_eip_2.id
  subnet_id     = aws_subnet.public_2.id 

  tags = {
    Name = "${var.project_name}-nat-gw-${var.availability_zone_2}"
  }
}