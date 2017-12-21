variable "cidr_base" {
  default = "10.0"
}

variable "cidr_blocks_allowed_to_ssh_bastion" {
  type = "list"
}

resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_base}.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  // Tags
  tags {
    Name = "${var.project}_${var.platform}_vpc"
    Project = "${var.project}"
    Platform = "${var.platform}"
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.project}_${var.platform}_igw"
    Project = "${var.project}"
    Platform = "${var.platform}"
  }
}

data "aws_availability_zones" "all" {}

resource "aws_subnet" "public_subnet_1" {
  depends_on = [
    "aws_internet_gateway.internet_gw"]

  // Base configuration
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.cidr_base}.1.0/24"
  availability_zone = "${data.aws_availability_zones.all.names[0]}"

  tags {
    Name = "${var.project}_${var.platform}_public_subnet_1"
    Project = "${var.project}"
    Platform = "${var.platform}"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.project}_${var.platform}_public_route_table"
    Project = "${var.project}"
    Platform = "${var.platform}"
  }
}

resource "aws_route_table_association" "association_public_subnet_1" {
  subnet_id = "${aws_subnet.public_subnet_1.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

resource "aws_route" "route_internet_gateway" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.internet_gw.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

resource "aws_security_group" "dmz_sg" {

  vpc_id = "${aws_vpc.vpc.id}"
  name = "${var.project}_${var.platform}_dmz"

  tags {
    Name = "${var.project}_${var.platform}_dmz"
    Project = "${var.project}"
    Platform = "${var.platform}"
  }
}

resource "aws_security_group_rule" "allow_dmz_22_from_specific_ips" {
  depends_on = [
    "aws_security_group.dmz_sg"]
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = "${aws_security_group.dmz_sg.id}"
  cidr_blocks = "${var.cidr_blocks_allowed_to_ssh_bastion}"
}

resource "aws_security_group_rule" "allow_dmz_all_self" {
  depends_on = [
    "aws_security_group.dmz_sg"]
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  self = "true"
  security_group_id = "${aws_security_group.dmz_sg.id}"
}

resource "aws_security_group_rule" "allow_dmz_all_out" {
  depends_on = [
    "aws_security_group.dmz_sg"]
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [
    "0.0.0.0/0"]
  security_group_id = "${aws_security_group.dmz_sg.id}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
