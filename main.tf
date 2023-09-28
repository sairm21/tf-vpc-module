resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_support = true

  tags = {
    Name = "VPC-${var.env}"
  }
}

