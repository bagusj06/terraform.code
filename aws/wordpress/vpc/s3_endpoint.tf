resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id       = aws_vpc.main_vpc.id
  service_name = "com.amazonaws.ap-southeast-1.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.private_1_rtb.id,
    aws_route_table.private_2_rtb.id
  ]

  tags = {
    Name = "${var.project_name}-vpce-s3"
  }
}