variable "region" {
  description = "enter the region name"
  type        = string
  default     = "us-east-2"
}
variable "subnets_cidr" {
  description = "subnet cidr values"
  type        = string
  default     = "192.168.0.0/24"
}
variable "ntier_vpc_details" {
  description = "mentioned vpc details like vpc range, subnetnames, availabilty zones and tagnames"
  type = object({
    vpc_cidr     = string
    subnet_azs   = string
    subnet_names = string

  })
  default = {
    vpc_cidr     = "192.168.0.0/16"
    subnet_azs   = "a"
    subnet_names = "sub1"
  }
}