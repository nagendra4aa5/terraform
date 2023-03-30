variable "region" {
  description = "enter the region name"
  type        = string
  default     = "us-east-2"
}
variable "subnets_cidr" {
  description = "subnet cidr values"
  type        = list(string)
  default     = ["192.168.0.0/24", "192.168.1.0/24"]
}
variable "ntier_vpc_details" {
  description = "mentioned vpc details like vpc range, subnetnames, availabilty zones and tagnames"
  type = object({
    vpc_cidr     = string
    subnet_azs   = list(string)
    subnet_names = list(string)

  })
  default = {
    vpc_cidr     = "192.168.0.0/16"
    subnet_azs   = ["a", "b"]
    subnet_names = ["sub1", "sub2"]
  }
}
  