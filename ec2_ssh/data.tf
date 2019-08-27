data "aws_availability_zones" "available" {}
data "aws_region" "current" {}

data "template_file" "ec2_userdata" {
  count    = "${var.instance_count}"
  template = "${file(var.user_data)}"
  vars = {
    dtap = "${terraform.workspace}"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  owners = ["137112412989"]
}

data "aws_ami" "windows_2016" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2016-English-Full-Base*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  owners = ["801119661308"]
}

data "aws_ami" "windows_2019" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  owners = ["801119661308"]
}
