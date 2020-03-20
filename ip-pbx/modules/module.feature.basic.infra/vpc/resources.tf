resource "aws_vpc" "basic_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = merge(
  {
    "Name" = "vpc-${var.project}-${var.env}-vpc"
    "Env" = var.env
    "Project" = var.project
  }
  )
}

resource "aws_internet_gateway" "basic_igw" {
  vpc_id = aws_vpc.basic_vpc.id

  tags = merge(
  {
    "Name" = "${var.project}-${var.env}-igw"
    "Env" = var.env
    "Project" = var.project
  }
  )
}



