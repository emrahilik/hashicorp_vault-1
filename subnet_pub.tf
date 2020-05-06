# Public Subnets

resource "aws_subnet" "public1" {
  vpc_id            = "${aws_vpc.vault.id}"
  cidr_block        = "${var.cidr_block1_public}"
  availability_zone = "${var.region}${var.az1}"

  tags                    = "${var.tags}"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public2" {
  vpc_id                  = "${aws_vpc.vault.id}"
  cidr_block              = "${var.cidr_block2_public}"
  availability_zone       = "${var.region}${var.az2}"
  tags                    = "${var.tags}"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public3" {
  vpc_id                  = "${aws_vpc.vault.id}"
  cidr_block              = "${var.cidr_block3_public}"
  availability_zone       = "${var.region}${var.az3}"
  tags                    = "${var.tags}"
  map_public_ip_on_launch = true
}
