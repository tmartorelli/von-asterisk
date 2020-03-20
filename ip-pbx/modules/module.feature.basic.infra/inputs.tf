variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_cidrs_ipv4" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "aws_region" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}
