resource "aws_ssm_parameter" "cw_agent_cfg" {
  name      = "${local.cw_agent_ssm_path}"
  overwrite = true
  type      = "String"
  value     = "${data.template_file.cw_agent_tux.rendered}"
}

