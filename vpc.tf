resource "aws_vpc" "vault" {
  cidr_block = "${var.cidr_block}"
  tags       = "${var.tags}"
}
