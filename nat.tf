resource "aws_nat_gateway" "nat_gateway" {
    count                   = length(var.public_subnets_cidrs)

    connectivity_type       = "public"
    allocation_id           = var.aws_eip[count.index]
    subnet_id               = var.public_subnets[count.index]
    
    tags = {
        Name    = "nat-public-${var.vpc_name}-${element(split("-", element(data.aws_availability_zones.available.names, count.index)),2)}"
        env     = var.env
    }
}