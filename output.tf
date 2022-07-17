output "private_subnets" {
  value = aws_subnet.private.*.id
}

output "public_subnets" {
  value = aws_subnet.public.*.id
}

output "aws_eip" {
  value = aws_eip.nat_gateway.*.id
}

output "nat_gateway" {
  value = aws_nat_gateway.nat_gateway.*.id
}

output "route_table_private" {
  value = aws_route_table.private_routes.*.id  
}

output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway.*.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}