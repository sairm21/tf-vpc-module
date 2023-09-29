resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_support = true

  tags = merge({
    Name = "VPC-${var.env}"
  },
    var.tags)
}

module "subnets" {
  source = "./subnets"
  for_each = var.subnets
  cidr_block = each.value["cidr_block"]
  subnet_name= each.key
  vpc_id =aws_vpc.main.id
  env = var.env
  tags = var.tags
  az=var.az
}