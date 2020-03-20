output "vpc_id" {
  value = aws_vpc.basic_vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.basic_igw.id
}