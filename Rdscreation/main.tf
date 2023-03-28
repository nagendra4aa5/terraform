resource "aws_vpc" "narendra" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "nc"
  }

}

resource "aws_subnet" "subnet1" {
  cidr_block = "192.168.0.0/24"
  vpc_id     = aws_vpc.narendra.id
  tags = {
    Name = "subnetnc"
  }
}
resource "aws_security_group" "joip" {
  name        = "joip"
  description = "security group for rds creation"
  vpc_id      = aws_vpc.narendra.id
  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.narendra.cidr_block]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.narendra.cidr_block]
  }
}
resource "aws_db_instance" "joipdb" {
  allocated_storage   = 10
  db_name             = "joipdb"
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = "db.t3.micro"
  username            = "prakash"
  password            = "narendra"
  skip_final_snapshot = true
}



