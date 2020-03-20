variable "vpc_id" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "public_cidrs_ipv4" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "env" {
  type = string
}

variable "project" {
  type = string
}

variable "map_public_ip_on_launch" {
  type = bool
  default = true
}