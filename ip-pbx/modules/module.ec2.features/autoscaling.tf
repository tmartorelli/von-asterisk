resource "aws_autoscaling_group" "asg_voip_server" {
  name = "${var.project}-${var.env}-voip"
  vpc_zone_identifier = var.voip_subnets_id

  max_size = var.max_size
  min_size = var.min_size
  launch_configuration = aws_launch_configuration.lc_voip_server.id
  force_delete = var.force_delete

  health_check_grace_period = var.health_check_grace_period
  health_check_type = "EC2"

  tags = [
    {
      key = "Name"
      propagate_at_launch = true
      value = "${var.project}-${var.env}-lc"
    },
    {
      key = "Environment"
      propagate_at_launch = true
      value = var.env
    }
  ]
}

resource "aws_launch_configuration" "lc_voip_server" {
  name_prefix = "${var.project}-${var.env}-lc"
  image_id = var.image_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.voip_instance_profile.name
  user_data = var.voip_userdata
  security_groups = var.voip_sg
  key_name = var.key_pair

  associate_public_ip_address = true

  root_block_device {
    volume_size = var.instance_root_volume_size
    volume_type = "gp2"
  }

  lifecycle {
    create_before_destroy = true
  }
}
