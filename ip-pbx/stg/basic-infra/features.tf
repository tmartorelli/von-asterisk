module "basic-infra" {
  source = "../../modules/module.feature.basic.infra"

  vpc_cidr_block     = var.vpc_cidr_block
  availability_zones = var.availability_zones
  aws_region         = data.aws_region.current.name

  public_cidrs_ipv4 = var.public_cidrs_ipv4
  public_subnet_ids = module.basic-infra.public_subnet_ids

  project = var.project
  env     = var.env
}

data "template_file" "voip_userdata" {
  template = file("${path.module}/voip_userdata.sh")

  vars = {
    Enviroment = var.env
    Region     = data.aws_region.current.name
  }
}

module "ec2" {
  source                    = "../../modules/module.ec2.features"
  vpc_id                    = module.basic-infra.vpc_id
  availability_zones        = var.availability_zones
  force_delete              = false
  health_check_grace_period = 300
  image_id                  = var.image_id
  instance_type             = var.instance_type
  key_pair                  = var.key_pair
  max_size                  = 1
  min_size                  = 1
  voip_sg                   = [module.ec2.voip_sg_id]
  voip_subnets_id           = module.basic-infra.public_subnet_ids
  voip_userdata             = data.template_file.voip_userdata.rendered
  env                       = var.env
  project                   = var.project
}