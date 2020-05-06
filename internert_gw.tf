resource "aws_internet_gateway" "vault" {
  vpc_id = "${aws_vpc.vault.id}"
  tags   = "${var.tags}"
}
