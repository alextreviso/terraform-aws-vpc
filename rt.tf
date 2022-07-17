resource "aws_route_table" "private_routes" {
  count = length(var.private_subnets_cidrs)
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway[count.index]
  }

  tags = {
    Name    = "rt-private-${var.vpc_name}-${element(split("-", element(data.aws_availability_zones.available.names, count.index)),2)}"
    env     = var.env
  }
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets)
  subnet_id      = var.private_subnets[count.index]
  route_table_id = var.route_table_private[count.index]
}

resource "aws_default_route_table" "public_routes" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name    = "rt-public-${var.vpc_name}"
    env     = var.env
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = var.public_subnets[count.index]
  route_table_id = aws_default_route_table.public_routes.id
}