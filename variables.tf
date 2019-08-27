variable "name_prefix" {
  default = "mdb"
}

variable "region" {
  default = "eu-west-1"
}
# Tags
variable "default_tags" {
  type = "map"
  default = {
    Github-Repo = "rb-org/mdb-tfm-base"
    Terraform   = "true"
  }
}
# Account IDs
variable "account_id" {
  default = "827734529707"
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
