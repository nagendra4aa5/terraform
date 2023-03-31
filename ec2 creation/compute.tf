resource "aws_security_group" "asg" {
  name        = "asg"
  description = "security group with http and ssh"
  vpc_id      = aws_vpc.ntier.id

  ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.ntier.cidr_block]
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.ntier.cidr_block]
  }
  tags = {
    Name = "asg"
  }
  depends_on = [
    aws_subnet.subnets
  ]
}
resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFqgbDvFdCdef3ApPLlllvVIbkWMhwq0hWOQ7WBAaMOGoNjWjyE9hOJJGrji9L3F4eb63JPHZICk3nJyzZyz56nHD9eSB7onHgfdPrxWEAUVHDJf0PBfXG2ynyFqoMyJsG0Iq3+VnCn1k4xTfUtuhqwqhT4XSozqO6eQIXMCE4iqAKuyq9daEAPkqnvZ1K1WzJ3HUYIauIKEr5BwbnxWoNufMQYh7LH/HEf6DxVelDAhtqocqxR6sIeWwbYEZNFyLhOiRksPLsZi1UNO/mR80dAgMzhC7lX4NsFX4Db1Y0GB7NVG3113uQqb2QDQ6dT4JFytqOsiHZGR4c5Ca7Zt0cqCexD2R8lUDm5jOf8DZv8hnTxtFIPRiRRgfG5GFTaZOUYu9DsCtvrp5iRsjHwCJe8uDl/OMwBeNyg2zE3E+A6yDjM/wGFhYFdtmnXRmIMAYXvBXOgFKu9NmTqPHlWcP4VjvrLdlAyNhjHP6dkZKD4vPzg2j8rdPzKZ5WmYS2O2k= nagen@Nimmagaddas-DESKTOP"
}
resource "aws_instance" "myinstance" {
  ami                         = "ami-0a695f0d95cefc163"
  subnet_id                   = data.aws_subnets.subnets.ids[0]
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.asg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.mykeypair.id
  tags = {
    "Name" = "myinstance"
  }
  depends_on = [
    aws_security_group.asg
  ]
}

