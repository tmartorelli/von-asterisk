module "vpc" {
  source = "./vpc"
  vpc_cidr_block = var.vpc_cidr_block
  public_cidrs_ipv4 = var.public_cidrs_ipv4

  project = var.project
  env = var.env
}

module "subnet" {
  source = "./subnets"
  aws_region = var.aws_region
  availability_zones = var.availability_zones
  vpc_id = module.vpc.vpc_id

  public_cidrs_ipv4 = var.public_cidrs_ipv4

  project = var.project
  env = var.env
}

module "route-tables" {
  source = "./route-tables"
  vpc_id = module.vpc.vpc_id
  igw_id = module.vpc.igw_id

  public_cidrs_ipv4 = var.public_cidrs_ipv4
  public_subnet_ids = module.subnet.public_subnet_ids

  project = var.project
  env = var.env
}