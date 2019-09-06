locals {
  # os     = "${var.os == "amz_linux2" ? data.aws_ami.amazon_linux.image_id : var.os == "windows_2016" ? data.aws_ami.windows_2016.image_id : data.aws_ami.windows_2019.image_id}"
  name   = "${var.name_prefix}-${terraform.workspace}-${var.name}"
  prefix = "${var.name_prefix}-${terraform.workspace}"

  cw_agent_ssm_path = "/${terraform.workspace}/cw_agent/${local.name}"
  log_group_name    = "/ec2/${local.name}"
  user_data         = "${var.os == "amz_linux2" ? "userdata_amz.sh" : "userdata_ubu.sh"}"
  # user_data_template = "${path.root}/files/${local.user_data}"
  cw_agent_template = "${var.os == "amz_linux2" ? "cw_agent_amz.tpl" : "cw_agent_ubu.tpl"}"
}
