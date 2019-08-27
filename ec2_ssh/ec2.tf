// Elastic IP
resource "aws_eip" "main" {
  count    = "${var.public_ip ? var.instance_count : 0}"
  instance = "${element(aws_instance.main.*.id, count.index)}"
  vpc      = true

  tags = {
    "Name" = "${local.name}-${count.index}"
    "Env"  = "${terraform.workspace}"
  }
}

// EC2 instance
resource "aws_instance" "main" {
  count                  = "${var.instance_count}"
  ami                    = "${local.os}"
  instance_type          = "${var.instance_type[terraform.workspace]}"
  subnet_id              = "${element(var.public_subnets, count.index)}"
  iam_instance_profile   = "${aws_iam_instance_profile.instance_role_instance_profile.name}"
  vpc_security_group_ids = ["${aws_security_group.main.id}"]
  key_name               = "${var.key_pair[data.aws_region.current.name]}"

  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"
  # user_data         = "${element(data.template_file.ec2_userdata.*.rendered, count.index)}"

  lifecycle {
    create_before_destroy = true
    ignore_changes        = ["user_data", "ami"]
  }

  tags = {
    "Name" = "${local.name}-${count.index}"
    "Env"  = "${terraform.workspace}"
  }
}
