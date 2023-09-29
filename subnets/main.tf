resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
  count = length(var.cidr_block)
  cidr_block = element(var.cidr_block, count.index)
  availability_zone = element(var.az, count.index)


  tags = merge({
    Name = "${var.subnet_name}-${var.env}-subnet"
  },
    var.tags)
}