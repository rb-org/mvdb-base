variable "name_prefix" {}
variable "vpc_cidr" {}

variable "enable_nat_gateway" {
  default = false
}
variable "enable_vpn_gateway" {
  default = false
}

variable "default_tags" {
  type = "map"
}

variable "az_count" {
}

