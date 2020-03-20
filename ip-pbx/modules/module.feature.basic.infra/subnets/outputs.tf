output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "public_subnet_cidrs_ipv4" {
  value = aws_subnet.public.*.cidr_block
}
