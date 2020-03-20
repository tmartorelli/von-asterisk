variable "availability_zones" {
  type = list(string)
}

variable "vpc_cidr_block" {
  type = string
}

variable "env" {
  type = string
}

variable "project" {
  type = string
}

variable "public_cidrs_ipv4" {
  type = list(string)
}

variable "instance_type" {
  type = string
}

variable "key_pair" {
  type = string
}