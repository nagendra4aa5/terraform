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
variable "ntier_app1_cidr" {
  type        = string
  default     = "192.168.0.0/24"
  description = "app1 cidr range"

}
variable "ntier_app2_cidr" {
  type        = string
  default     = "192.168.1.0/24"
  description = "app2 cidr range"

}
variable "ntier_db1_cidr" {
  type        = string
  default     = "192.168.2.0/24"
  description = "db1 cidr range"

}
variable "ntier_db2_cidr" {
  type        = string
  default     = "192.168.3.0/24"
  description = "db2 cidr range"

}