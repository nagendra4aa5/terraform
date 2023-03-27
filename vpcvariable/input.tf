variable "region" {
  type        = string
  default     = "us-east-2"
  description = "enter the region name"

}

variable "ntier_vpc_range" {
  type        = string
  default     = "192.168.0.0/16"
  description = "ntier vpc range"

}