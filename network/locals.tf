locals {
  name = "${var.name_prefix}-${terraform.workspace}"
  private_subnets = slice([
    cidrsubnet(var.vpc_cidr, 8, 51),
    cidrsubnet(var.vpc_cidr, 8, 52),
    cidrsubnet(var.vpc_cidr, 8, 53),
  ], 0, (var.az_count))

  public_subnets = slice([
    cidrsubnet(var.vpc_cidr, 8, 1),
    cidrsubnet(var.vpc_cidr, 8, 2),
    cidrsubnet(var.vpc_cidr, 8, 3),
  ], 0, (var.az_count))

  db_subnets = slice([
    cidrsubnet(var.vpc_cidr, 8, 61),
    cidrsubnet(var.vpc_cidr, 8, 62),
    cidrsubnet(var.vpc_cidr, 8, 63),
  ], 0, (var.az_count))

  cache_subnets = slice([
    cidrsubnet(var.vpc_cidr, 8, 31),
    cidrsubnet(var.vpc_cidr, 8, 32),
    cidrsubnet(var.vpc_cidr, 8, 33),
  ], 0, (var.az_count))
}
