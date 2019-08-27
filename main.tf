module "network" {
  source = "./network"

  name_prefix  = var.name_prefix
  vpc_cidr     = var.vpc_cidr
  default_tags = var.default_tags
  az_count     = var.az_count
}


module "ec2_ssh" {
  source = "./ec2_ssh"

  name_prefix    = var.name_prefix
  vpc_id         = module.network.vpc_id
  public_subnets = module.network.public_subnets
  allowed_ips    = var.allowed_ips
  instance_count = var.instance_count["ssh"]
  key_pair       = var.key_pair
}
