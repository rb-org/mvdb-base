# CloudWatch Log Groups 
resource "aws_cloudwatch_log_group" "cw_log_group" {
  name              = "${local.log_group_name}"
  retention_in_days = "${var.log_group_retention}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", "${local.name}",
      "Workspace", format("%s", terraform.workspace)
    )
  )}"
}
