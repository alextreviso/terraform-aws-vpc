resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "igw-${var.vpc_name}"
    env     = var.env
  }
}