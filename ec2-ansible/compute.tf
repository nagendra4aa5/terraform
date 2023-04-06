data "aws_security_group" "launch-wizard-25" {
  name = "launch-wizard-25"
}
data "aws_key_pair" "mykeypair" {
  key_name           = "mykeypair"
  include_public_key = true

}
resource "aws_instance" "myec2ansible" {
  ami                         = "ami-0103f211a154d64a6"
  subnet_id                   = data.aws_subnet.first.id
  instance_type               = "t2.micro"
  #vpc_security_group_ids      = data.aws_security_group.launch-wizard-25.id
  associate_public_ip_address = true
  key_name                    = "mykeypair"
  user_data                   = file("ansible.sh")
  tags = {
    "Name" = "myec2ansible"
  }
}

