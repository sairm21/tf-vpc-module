resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  count = length(var.cidr_block)
  cidr_block = element(var.cidr_block, count.index)
  availability_zone = element(var.az, count.index)


  tags = merge({
    Name = "${var.subnet_name}-${var.env}-subnet"
  },
    var.tags)
}

resource "aws_route_table" "routes" {
  vpc_id = var.vpc_id

/*
  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }
*/

  tags = merge({
    Name = "${var.subnet_name}-${var.env}-RT"
  },
    var.tags)
}

resource "aws_route_table_association" "association" {
  count = length(aws_subnet.main.*.id)
  subnet_id      = element(aws_subnet.main.*.id, count.index)
  route_table_id = aws_route_table.routes.id
}