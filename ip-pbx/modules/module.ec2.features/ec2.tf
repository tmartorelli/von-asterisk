resource "aws_instance" "voip_server" {
  ami = var.image_id
  instance_type = var.instance_type
  availability_zone = "${var.aws_region}${var.availability_zone}"
  key_name = var.key_pair
  security_groups = var.voip_sg
  subnet_id = var.voip_subnet_id
  user_data = var.voip_userdata
  iam_instance_profile = aws_iam_instance_profile.voip_instance_profile.name

  root_block_device {
    volume_size = var.instance_root_volume_size
    volume_type = "gp2"
  }

  tags = {
    Name = "${var.project}-${var.env}-asterisk"
    Project = var.project
    Environment = var.env
  }
}

resource "aws_eip" "voip_eip" {
  vpc = true
  instance = aws_instance.voip_server.id

  tags = {
    Name = "${var.project}-${var.env}-eip"
    Project = var.project
    Environment = var.env
  }
}
