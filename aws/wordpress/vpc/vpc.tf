resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_ip_range
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}
