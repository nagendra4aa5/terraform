provider "aws" {
  region = "us-east-2"
}
resource "aws_vpc" "ntier" {
    cidr_block = "198.168.0.0/16"
    tags = {
    Name = "ntier"

  }
  
}