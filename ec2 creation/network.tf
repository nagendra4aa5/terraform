resource "aws_vpc" "ntier" {
  cidr_block = var.ntier_vpc_details.vpc_cidr
  tags = {
    Name = "myvpc1"
  }
}
resource "aws_subnet" "subnets" {
  cidr_block        = var.ntier_vpc_details.vpc_cidr
  availability_zone = "${var.region}${var.ntier_vpc_details.subnet_azs}"
  vpc_id            = aws_vpc.ntier.id
  tags = {
    Name = var.ntier_vpc_details.subnet_names
  }
  depends_on = [
    aws_vpc.ntier
  ]
}
resource "aws_internet_gateway" "igw" {
  vpc_id = local.vpc_id
  tags = {
    Name = "igw"
  }
  depends_on = [
    aws_vpc.ntier
  ]

}
resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.ntier.id
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.igw.id


  }
  tags = {
    Name = "myrt"
  }
  depends_on = [
    aws_internet_gateway.igw,
    aws_subnet.subnets
  ]
}
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = [var.ntier_vpc_details.subnet_names]
  }
  depends_on = [
    aws_subnet.subnets
  ]
}

resource "aws_route_table_association" "myrt_association" {
  subnet_id      = aws_subnet.subnets.id
  route_table_id = aws_route_table.myrt.id

}