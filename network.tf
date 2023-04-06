data "aws_vpc" "default" {
  default = true

}
data "aws_subnet" "first" {
  availability_zone = "${var.region}a"
  vpc_id            = data.aws_vpc.default.id
}