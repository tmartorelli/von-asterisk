variable "vpc_id" {
  type = string
}

variable "public_cidrs_ipv4" {
  type = list(string)
}

variable "igw_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "project" {
  type = string
}

variable "env" {
  type = string
}