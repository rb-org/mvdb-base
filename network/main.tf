module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.9.0"

  name = "${var.name_prefix}-vpc"
  cidr = var.vpc_cidr

  # Subnets & AZs
  azs              = slice(data.aws_availability_zones.available.names, 0, var.az_count)
  private_subnets  = local.private_subnets
  public_subnets   = local.public_subnets
  database_subnets = local.db_subnets

  # DNS & DHCP
  enable_dns_hostnames             = true
  enable_dns_support               = true
  enable_dhcp_options              = true
  dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]
  dhcp_options_domain_name         = ""

  # Endpoints
  enable_apigw_endpoint    = true
  enable_dynamodb_endpoint = true

  # Gateways
  enable_nat_gateway     = var.enable_nat_gateway
  enable_vpn_gateway     = var.enable_vpn_gateway
  reuse_nat_ips          = true                  # <= Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids    = "${aws_eip.nat.*.id}" # <= IPs specified here as input to the module
  one_nat_gateway_per_az = true

  # Tags & Prefixes
  tags = "${merge(var.default_tags,
    map("Name", "${var.name_prefix}-vpc"),
    map("Environment", "${lower(terraform.workspace)}"),
    )
  }"
  public_subnet_suffix   = "pub"
  private_subnet_suffix  = "prv"
  database_subnet_suffix = "dbs"
}

resource "aws_eip" "nat" {
  count = var.az_count
  vpc   = true
  tags = "${merge(var.default_tags,
    map("Name", "${var.name_prefix}-nat-gw"),
    map("Environment", "${lower(terraform.workspace)}"),
    )
  }"
}
