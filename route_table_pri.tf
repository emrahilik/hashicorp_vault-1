resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.vault.id}"
  tags   = "${var.tags}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.vault.id}"
  }
}

resource "aws_route_table_association" "private1" {
  subnet_id      = "${aws_subnet.private1.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private2" {
  subnet_id      = "${aws_subnet.private2.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private3" {
  subnet_id      = "${aws_subnet.private3.id}"
  route_table_id = "${aws_route_table.private.id}"
}
