// Security Group Resource for Interface Endpoints (S3, Api GW)

// API GW
resource "aws_security_group" "apigw_endpoint" {
  name        = "${local.name}-apigw-endpoint-sg"
  description = "API GW Endpoint SG"
  vpc_id      = module.vpc.vpc_id

  tags = {
    "Name" = "${local.name}-apigw-endpoint-sg"
    "Env"  = "${terraform.workspace}"
  }
}

resource "aws_security_group_rule" "ir_apigw_endpoint_self" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  self              = "true"
  security_group_id = "${aws_security_group.apigw_endpoint.id}"
  description       = "Ingress rule - API GW - Self"
}

