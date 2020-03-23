variable "availability_zone" {
  type = string
}

variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "voip_subnet_id" {
  type = string
}

variable "voip_userdata" {
  type = string
}

variable "voip_sg" {
  type = list(string)
}

variable "key_pair" {
  type = string
}

variable "instance_root_volume_size" {
  type = string
  default = "30"
}

variable "vpc_id" {
  type = string
}

variable "aws_region" {
  type = string
}
