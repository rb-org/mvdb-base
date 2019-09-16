variable "name_prefix" {
  default = "mvdb"
}

variable "region" {
  default = "eu-west-1"
}
# Tags
variable "default_tags" {
  type = "map"
  default = {
    Github-Repo = "rb-org/mvdb-tfm-base"
    Terraform   = "true"
    Creator     = "rupert"
  }
}
# Account IDs
variable "account_id" {
}

# Remote State S3 Bucket
variable "remote_state_s3_auto" {
  description = "S3 bucket name holding the Terraform remote state file"
  default     = "tfm-remote-state"

}

# VPC
variable "vpc_cidr" {}
variable "az_count" {}


# EC2
variable "allowed_ips" {
  type    = "list"
  default = ["92.109.81.211/32", "92.65.74.100/32"]
}

variable "instance_count" {
  type = "map"
}

variable "key_pair" {
  type = "map"
}

variable "os" {
  type = "map"
  default = {
    ssh = "ubuntu_1804"
  }
}

