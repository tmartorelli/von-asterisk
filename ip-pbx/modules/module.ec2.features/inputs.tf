variable "availability_zones" {
  type = list(string)
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "force_delete" {
  type = bool
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

variable "voip_subnets_id" {
  type = list(string)
}

variable "health_check_grace_period" {
  type = number
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
