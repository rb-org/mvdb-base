// Security Group Resource for Instances
resource "aws_security_group" "main" {
  name        = "${local.name}-sg"
  description = "Webapp SG"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.default_tags,
    map("Name", "${local.prefix}-sg"),
    map("Workspace", "${lower(terraform.workspace)}"),
    )
  }"
}

// Ingress rule for Tomcat
resource "aws_security_group_rule" "ir_8080" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = "${var.allowed_ips}"
  security_group_id = "${aws_security_group.main.id}"
  description       = "Ingress rule - allow http over 8080"
}

resource "aws_security_group_rule" "ir_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = "${var.allowed_ips}"
  security_group_id = "${aws_security_group.main.id}"
  description       = "Ingress rule - allow SSH"
}
resource "aws_security_group_rule" "ir_rdp" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = "${var.allowed_ips}"
  security_group_id = "${aws_security_group.main.id}"
  description       = "Ingress rule - allow RDP"
}

// Egress rule for Instances
resource "aws_security_group_rule" "er" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.main.id}"
  description       = "Egress rule from ${upper(var.name)} to all"
}
