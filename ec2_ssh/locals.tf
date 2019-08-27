locals {
  os = "${var.os == "amz_linux2" ? data.aws_ami.amazon_linux.image_id : var.os == "windows_2016" ? data.aws_ami.windows_2016.image_id : data.aws_ami.windows_2019.image_id}"

}
