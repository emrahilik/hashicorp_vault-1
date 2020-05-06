resource "aws_nat_gateway" "vault" {
  allocation_id = "${aws_eip.vault.id}"
  subnet_id     = "${aws_subnet.public1.id}"
  tags          = "${var.tags}"
}
