provider "aws" {
  region = var.region
}
resource "aws_vpc" "ntier" {
  cidr_block = var.ntier_vpc_range
  tags = {
    Name = "ntier"

  }

}