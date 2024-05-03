resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.project_name}-rtb-public"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_igw.id
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_rtb.id
}   

# Private Route Table and Routes for each private subnet
resource "aws_route_table" "private_1_rtb" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.project_name}-rtb-private-${var.availability_zone_1}"
  }
}

resource "aws_route" "private_1_nat_access" {
  route_table_id         = aws_route_table.private_1_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_1.id
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1_rtb.id
}

resource "aws_route_table" "private_2_rtb" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.project_name}-rtb-private-${var.availability_zone_2}"
  }
}

resource "aws_route" "private_2_nat_access" {
  route_table_id         = aws_route_table.private_2_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_2.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_2_rtb.id
}

################################### S3 ENDPOINT ###################################
resource "aws_route_table_association" "s3_private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1_rtb.id
}

resource "aws_route_table_association" "s3_private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_2_rtb.id
}