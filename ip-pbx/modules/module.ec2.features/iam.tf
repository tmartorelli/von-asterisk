resource "aws_iam_role" "voip_instance_role" {
  name = "${var.project}-${var.env}-rol"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "voip_instance_profile" {
  name = "${var.project}-${var.env}-iip"
  role = aws_iam_role.voip_instance_role.name
}

resource "aws_iam_role_policy_attachment" "ssm_policy_attachmemt" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role = aws_iam_role.voip_instance_role.name
}


