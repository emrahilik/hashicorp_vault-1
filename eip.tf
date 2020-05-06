resource "aws_eip" "vault" {
  vpc  = true
  tags = "${var.tags}"
}
