resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = merge(
  {
    "Name" = "pub-rt-${var.project}-${var.env}-${count.index}"
    "Env" = var.env
    "Project" = var.project
  }
  )
  count = length(var.public_cidrs_ipv4)
}

resource "aws_route_table_association" "public_rt_association" {
  route_table_id = element(aws_route_table.public_route_table.*.id, count.index)
  subnet_id = element(var.public_subnet_ids, count.index)

  count = length(var.public_cidrs_ipv4)
}