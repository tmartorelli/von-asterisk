data "aws_region" "current" {}

//data "aws_ami" "ami" {
//  most_recent = true
//
//  filter {
//    name   = "name"
//    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
//  }
//
//  filter {
//    name   = "virtualization-type"
//    values = ["hvm"]
//  }
//  owners = ["137112412989"]
//}