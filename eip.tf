resource "aws_eip" "nat_gateway" {
    count   = length(var.public_subnets_cidrs)
    vpc     = true
}