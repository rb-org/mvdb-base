data "aws_availability_zones" "available" {}
data "aws_region" "current" {}

data "template_file" "ec2_userdata" {
  count    = "${var.instance_count}"
  template = "${file("${path.root}/files/${local.user_data}")}"

}

data "template_file" "cw_agent_tux" {
  template = "${file("${path.root}/files/${local.cw_agent_template}")}"

  vars = {
    instance_name = "${local.name}"
    prefix        = "ec2"
  }
}
