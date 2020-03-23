resource "aws_subnet" "public" {
  cidr_block = element(var.public_cidrs_ipv4, count.index)
  vpc_id = var.vpc_id
  availability_zone = "${var.aws_region}${var.availability_zone}"
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
  {
    "Name" = "public-subnet-${var.availability_zone}-${var.env}-${count.index}"
    "Env" = var.env
    "Project" = var.project
  }
  )
  count = length(var.public_cidrs_ipv4)
}
