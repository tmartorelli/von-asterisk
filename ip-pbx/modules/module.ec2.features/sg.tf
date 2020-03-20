resource "aws_security_group" "voip_sg" {
  name = "${var.project}-${var.env}-voip-sg"
  description = "Allow inbound traffic from my own IP to port 5060"
  vpc_id = var.vpc_id

  ingress {
    from_port = 5060
    protocol = "UDP"
    to_port = 5060
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 16374
    protocol = "UDP"
    to_port = 32767
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["86.152.220.76/32"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}