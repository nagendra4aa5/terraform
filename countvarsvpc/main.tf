resource "aws_vpc" "ntier" {
  cidr_block = var.ntier_vpc_details.vpc_cidr
  tags = {
    Name = "myvpc1"
  }
}
resource "aws_subnet" "subnets" {
  count             = length(var.ntier_vpc_details.subnet_names)
  cidr_block        = cidrsubnet(var.ntier_vpc_details.vpc_cidr, 8, count.index)
  availability_zone = "${var.region}${var.ntier_vpc_details.subnet_azs[count.index]}"
  vpc_id            = aws_vpc.ntier.id
  tags = {
    Name = var.ntier_vpc_details.subnet_names[count.index]
  }
 depends_on = [
    aws_vpc.ntier
  ]
}