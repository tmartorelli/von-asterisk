variable "vpc_cidr_block" {
  type = string
}

variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "public_cidrs_ipv4" {
  type = list(string)
}



